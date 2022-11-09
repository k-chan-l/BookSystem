-- main path
local ReplicatedStorageActivityFolder = game.ReplicatedStorage.Activity

-- sub path
local GetActivitiesFunction = ReplicatedStorageActivityFolder.Asset.Function.GetActivities

local ActivityManager = {}
ActivityManager.__index = ActivityManager
ActivityClass = require(script.Parent.Activity)


--[[
액티비티 매니저 생성시
1. 각 스테이지를 등록한다.

유저 액티비티 접근 요청시
1. 액티비티에 이벤트를 보낸다.

유저 액티비티 이탈시
1. 이벤트를 받아서 진행사항을 전달한다.


]]--


function ActivityManager.new(list:table)
	print("begin make ActivityManager")
	local newActivityManger = {}
	setmetatable(newActivityManger, ActivityManager)
	newActivityManger.Activities = {}
	newActivityManger:loadActivity(list)
	print("end make ActivityManager")
	
	GetActivitiesFunction.OnServerInvoke = function()
		return newActivityManger:getActivities()
	end
	
	return newActivityManger
end

function ActivityManager:loadActivity(list) -- table
	print("load Activity")
	--print(type(list))
	for i, v in pairs(list) do		
		self:addActivity(v["id"], ActivityClass.new(v["id"],v["name"],v["stage"],v["entrance"],v["stageScript"],v["missions"]))
	end
end

function ActivityManager:addActivity(id:int, activity:ActivityClass)
	--key value 구조로 변경하여 한번에 검색 가능하도록
	self.Activities[id] = activity
end

--function ActivityManager:getActivity(activity:string)
	
--end

function ActivityManager:getActivities()
	return self.Activities
end

function ActivityManager:start(player:Player, activityNumber:int)
	local activity = self.Activities[activityNumber]
	print(activity)
	-- 플레이어에게 해당 액티비티의 정보 받아오기
	activity:activityStart(player)
	-- 이벤트를 이용해 매칭 결과 확인 필요?
	--activity:Start(0, {player})
end


return ActivityManager
