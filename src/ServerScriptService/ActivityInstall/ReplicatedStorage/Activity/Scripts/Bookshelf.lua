local Bookshelf = {}
-- main path
local ReplicatedStorageActivityFolder = game.ReplicatedStorage.Activity

-- sub path
local playerDataFunction = ReplicatedStorageActivityFolder.Asset.Function.PlayerData
local GetActivitiesFunction = ReplicatedStorageActivityFolder.Asset.Function.GetActivities
local missionStart = ReplicatedStorageActivityFolder.Asset.Event.MissionStart
local missionEnd = ReplicatedStorageActivityFolder.Asset.Event.MissionEnd
local WeekClass = require(ReplicatedStorageActivityFolder.Scripts.Week)
local PriorityQueue = require(ReplicatedStorageActivityFolder.Scripts.Utils.PriorityQueue)

-- event
local BookshelfCurrentUpdate = ReplicatedStorageActivityFolder.Asset.Event.BookshelfCurrentUpdate
local BookshelfWeeksNil = ReplicatedStorageActivityFolder.Asset.Event.BookshelfWeeksNil
local BookshelfCurrentWeekChange = ReplicatedStorageActivityFolder.Asset.Event.BookshelfCurrentWeekChange
local LocalManage = ReplicatedStorageActivityFolder.Asset.Event.LocalManage

Bookshelf.__index = Bookshelf

--[[
유저 접속시
1. 데이터 스토어에서 플레이어 정보를 받아옴 -> 진행사항 및 배정된 액티비티 목록, 현재 주차를 받아온다.
2. 배정된 액티비티를 바탕으로 불러온 플레이어 정보의 유효성 검사를 실시한다.(액티비티 변경되거나 추가되었을 경우를 위함)
3. 없는 정보가 있을경우 Server의 액티비티 매니저를 통해 저장된 액티비티에서 직접 받아와 초기화 한다.

유저 액티비티 접근 시
1. 해당 액티비티가 저장된 데이터를 찾아서 이벤트로 실어 보낸다.

유저 액티비티 종료 시
1. 이벤트를 통해 받은 액티비티 데이터를 저장한다.

유저 접속 종료시
1. 유저의 데이터를 데이터스토어에 저장한다.

]]--

--[[
2022-09-27 할일
weeks queue 형태로 설정v
weeks에서 current로 넘어갈때 이벤트 발생추가 v
weeks가 비었을 때 이벤트 발생 추가
]]--
function Bookshelf.new(weeks:table)
	print("begin make Bookshelf")
	local newBookshelf = {}
	setmetatable(newBookshelf, Bookshelf)
	
	newBookshelf.weeks = PriorityQueue.new()
	newBookshelf.current = {}
	newBookshelf.complete = {}
	newBookshelf.incomplete = {}
	newBookshelf.currentWeek = 0
	--newBookshelf.activities = GetActivitiesFunction:InvokeServer()
	--newBookshelf.firstday = DateTime.fromLocalTime(2022,09,20,0,0,0,0)
	newBookshelf.firstday = DateTime.now()
	
	-- Event
	newBookshelf.currentUpdate = BookshelfCurrentUpdate
	newBookshelf.currentWeekChange = BookshelfCurrentWeekChange
	newBookshelf.weeksNil = BookshelfWeeksNil
	newBookshelf.localManage = LocalManage
	
	-- Init
	newBookshelf:eventConnect()
	newBookshelf:initWeeks(weeks)
	newBookshelf:changeWeek()
	--newBookshelf:changeCurrent()
	--newBookshelf:initActivities()
	--newBookshelf:distributeActivities()
	
	--playerDataFunction.OnClientInvoke = function(activityName:string)
	--	return newBookshelf:findActivity(activityName)
	--end
	
	--missionEnd.OnClientEvent:Connect(function(id, mission)
	--	for i,v in pairs(newBookshelf.current.activityBooks) do -- 수정
	--		print("V",v)
	--		print("Mission", mission)
	--		for j, k in pairs(v.activities) do
	--			if k.id == id then
	--				k.missions[mission].clear = true

	--			end
	--			newBookshelf:checkClear(k)
	--		end
	--	end
	--	print(newBookshelf.current)
	--	for i, v in pairs(newBookshelf.current.activityBooks) do
	--		newBookshelf:disableActivities(v.activities) -- 수정
	--	end
	--	newBookshelf:distributeActivities()
	--	newBookshelf:changeCurrent()
	--end)
	
	print("end make Bookshelf")
	task.spawn(function()
		while true do
			wait(30)
			--newBookshelf.currentWeek = newBookshelf:calcWeek()
			--print(newBookshelf.currentWeek)
			--newBookshelf:distributeActivities()
			newBookshelf:changeWeek()
		end
	end)
	return newBookshelf
end

-- DataStore에서 각 Week에 무엇이 들어가야 하는지 받아와서 변수로 저장

-------------------------------------------------------------
-- 이벤트 구독
function Bookshelf:eventConnect()
	self.currentUpdate.Event:Connect(function()
		self:weeksNilCheck()
	end)
	self.currentWeekChange.Event:Connect(function()
		self:changeCurrent()
	end)
end

-- weeks가 비어있을 경우 이벤트 발생
function Bookshelf:weeksNilCheck()
	if self.weeks:Size() == 0 then
		self.weeksNil:Fire()
	end
end

-- PriorityQueue를 이용하여 초기화
function Bookshelf:initWeeks(weeks:table)
	for i, v in pairs(weeks) do
		self.weeks:Add(v,1)
	end
end

-- Current를 다음주로 바꾸는 함수
function Bookshelf:changeCurrent()
	local lastweek = self.current
	self.current = self.weeks:Pop()
	
	self.localManage:Fire(self.current, "ChangeCurrent")
	self.currentUpdate:Fire(lastweek)
end

-- 몇주 인지 계산하는 함수
function Bookshelf:calcWeek()
	--return math.floor((DateTime.now().UnixTimestamp - self.firstday.UnixTimestamp) / 604800) + 1
	return math.floor((DateTime.now().UnixTimestamp - self.firstday.UnixTimestamp) / 60) + 1 -- 테스트 기준 60초
end

-- 이번주를 바꾸는 함수
function Bookshelf:changeWeek()
	local prevWeek = self.currentWeek
	self.currentWeek = self:calcWeek()
	print(self.currentWeek)
	if prevWeek < self.currentWeek then
		self.currentWeekChange:Fire()
	end
end

-- 클리어 여부 변경하는 함수
function Bookshelf:setWeekClear(key:table, value:boolean)
	local path = table.remove(key,1) -- current 진행 중일 경우에만 사용 가능
	self.current:setWeekClear(key,value)
end
--------------------------------------------------------------


--function Bookshelf:addWeek(weeks:WeekClass)
--		--key value 구조로 변경하여 한번에 검색 가능하도록
--		table.insert(self.weeks, weeks)
--end

function Bookshelf:findActivity(activityName)
	print(self.current)
	for i,v in pairs(self.current.activityBooks) do
		print(v.activities[activityName])
		if v.activities[activityName] ~= nil then
			return v.activities[activityName] -- 수정
		end
	end	
	
end

--function Bookshelf:changeCurrent()
--	print(self.weeks)
--	self.current = self.weeks["week"..self.currentWeek]
--end

function Bookshelf:initActivities()
	for i, v in pairs(self.weeks) do
		for j, k in pairs(v.activityBooks) do
			print(k)
			self:disableActivities(k) -- 수정
		end
	end
end

function Bookshelf:checkClear(activity)
	print(activity)
	local flag = true
	for i, v in pairs(self.activities) do
		for j, k in pairs(v.missions) do
			flag = flag and activity.missions[k.Name].clear
		end
	end
	if flag then
		activity.clear = true
	end
end

function Bookshelf:disableActivities(activities)
	for i, v in pairs(activities) do
		if v.clear then
			for j, w in pairs(self.activities[v.id].missions) do
				if self.activities[v.id].stage:FindFirstChild(w.name) ~= nil then
					self.activities[v.id].stage[w.name]:destroy()
				end
			end
			if self.activities[v.id].stage:FindFirstChild("guard") ~= nil then
				self.activities[v.id].stage.guard:destroy()
			end
		else
			if v.id ~= nil then
				for j, w in pairs(self.activities[v.id].missions) do
					if v.missions[w.name].clear then
						if self.activities[v.id].stage:FindFirstChild(w.name) ~= nil then
							self.activities[v.id].stage[w.name]:destroy()
						end
					end
				end
			end
		end
	end
end



-- 퀘스트 분배, 퀘스트 리스트의 퀘스트를 배분한다. 기존의 리스트에 퀘스트가 있을 경우 없애지는 않고 덮어씌운다.
function Bookshelf:distributeActivities()
	local list = self.weeks
	self.complete = {}
	self.incomplete = {}
	
	for i, v in pairs(list) do -- week 순회
		v:distributeActivities(i, self.currentWeek, self.complete, self.incomplete)
	end
	print(self.complete, self.incomplete)
end

-- DataStore에서 각 Week에 무엇이 들어가야 하는지 받아와서 변수로 저장
function Bookshelf:load()

end

-- Data Store에서 각 Week에서 한 것들 전체를 저장하기
function Bookshelf:save()
	
end


-- 전체 내역 출력 테스트용
function Bookshelf:print()

end

-- Bookshelf 진행사항 변경 
--> UI에 출력 가능하도록 정보 출력하여 이벤트로 보내기 / 테스트 중에는 프린트만
function Bookshelf:changeData()

end


-- 캐릭터 접속시 액티비티 매니저에게 내용 받아오기
-- 생성자 각종 이벤트 구독
-- Bookshelf 저장
-- Bookshelf 불러오기 --> 액티비티 명, 진행사항
-- Bookshelf 출력 --> 단순 함수로 호출
-- Bookshelf 진행사항 변경 --> UI에 출력 가능하도록 정보 출력하여 이벤트로 보내기 / 테스트 중에는 프린트만

return Bookshelf
