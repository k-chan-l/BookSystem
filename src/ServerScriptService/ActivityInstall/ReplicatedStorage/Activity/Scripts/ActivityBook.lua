-- main path
local ReplicatedStorageActivityFolder = game.ReplicatedStorage.Activity

-- sub path
local ActClass = require(ReplicatedStorageActivityFolder.Scripts.Act)


local ActivityBook = {}
ActivityBook.__index = ActivityBook

function ActivityBook.new(config:table)
	print("begin make ActivityBook")
	local newActivityBook = {}
	setmetatable(newActivityBook, ActivityBook)
	
	--print(activities)
	--newActivityBook.activities = activities
	newActivityBook.activities = {}
	newActivityBook.name = config.actBook_name
	newActivityBook.clear = config.actBook_clear_flag
	newActivityBook.actvityBook_stage = config.activityBook_stage
	newActivityBook:initBook(config.acts)
	print("end make ActivityBook")
	return newActivityBook
end

-- DataStore에서 각 Week에 무엇이 들어가야 하는지 받아와서 변수로 저장
function ActivityBook:initBook(activities:table)
	for i, v in pairs(activities) do		
		self.activities[v.name] = v
	end

end

function ActivityBook:setActivityBookClear(key:table, value:boolean)
	self:setActClear(key, value)

	local flag = true
	for i , v in pairs(self.activities) do
		flag = flag and v:isActClear()
	end
	self.clear = flag

end

function ActivityBook:setActClear(key:table, value:boolean)
	local path = table.remove(key,1)
	self.activities[path]:setActClear(key,value)
end

function ActivityBook:isActivityBookClear()
	return self.clear
end

--function ActivityBook:distribute(weeks:WeekClass)
--		--key value 구조로 변경하여 한번에 검색 가능하도록
--		table.insert(self.weeks, weeks)
--end

function ActivityBook:checkActivityCompleteThisWeek(weekName:string, complete:table) -- 이번주
	for i, v in pairs(self.activities) do -- Activities 순회 (self.complete, weekname을 넘겨주어야 함)
		v:checkMissionCompleteThisWeek(i, complete, weekName)
	end
end

function ActivityBook:checkActivityCompletePastWeek(weekName:string, complete:table, incomplete:table) -- 지난주
	for i, v in pairs(self.activities) do -- Activities 순회 (self.complete, weekname, incomplete를 넘겨주어야 함)
		
	end
end



function ActivityBook:Open()
	
end
return ActivityBook
