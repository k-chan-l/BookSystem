-- main path
local ReplicatedStorageActivityFolder = game.ReplicatedStorage.Activity

-- sub path
--local PlayerMissionClass = require(ReplicatedStorageActivityFolder.Scripts.PlayerMission)
local ActivityEnd = ReplicatedStorageActivityFolder.Asset.Event.ActivityEnd

local Act = {}

Act.__index = Act

function Act.new(config:table)
	print("begin make Act")
	local newAct = {}
	setmetatable(newAct, Act)
	print("end make Activity")
	newAct.missions = {}
	--newAct.activity = activity
	newAct.name = config.act_name
	newAct.id = config.id
	newAct.clear = config.act_clear_flag
	newAct.act_stage = config.act_stage
	newAct.ActivityEnd = ActivityEnd
	newAct:Init(config.playerMissions)
	return newAct
end

function Act:Init(missions:table)
	for i, v in pairs(missions) do
		self.missions[v.name] = v
	end
end

function Act:setActClear(key:table, value:boolean)
	self:setMissionClear(key, value)
	
	local flag = true
	for i , v in pairs(self.missions) do
		flag = flag and v:isMissionClear()
	end
	self.clear = flag
	
	-- 09-29 추가
	if self:isActClear() then
		self.ActivityEnd:Fire(self)
		--self:removeStage()
	end
end

function Act:setMissionClear(key:table, value:boolean)
	local path = table.remove(key,1)
	self.missions[path]:setMissionClear(value)
end

function Act:isActClear()
	return self.clear
end

-- 09-29 추가
function Act:removeStage()
	if self.act_stage ~= nil then
		self.act_stage:Destroy()
	end
end

function Act:checkMissionCompleteThisWeek(activityName:string, complete:table, weekName:string)
	if self.clear then
		if complete[weekName] == nil then
			complete[weekName] ={}
		end
		complete[weekName][activityName] = self
	end
end

function Act:checkMissionCompletePastWeek(activityName:string, complete:table, incomplete:table, weekName:string)
	if self.clear then
		if complete[weekName] ==nil then
			complete[weekName] ={}
		end
		complete[weekName][activityName] = self
	else
		if incomplete[weekName] ==nil then
			incomplete[weekName] ={}
		end
		incomplete[weekName][activityName] = self
	end
end

return Act
