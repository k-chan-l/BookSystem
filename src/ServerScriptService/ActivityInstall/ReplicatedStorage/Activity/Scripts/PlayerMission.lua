local ReplicatedStorageActivityFolder = game.ReplicatedStorage.Activity


local MissionEnd = ReplicatedStorageActivityFolder.Asset.Event.MissionEnd

local PlayerMission = {}

PlayerMission.__index = PlayerMission

function PlayerMission.new(config:table)--, mission:Model)
	print("begin make PlayerMission")
	local newPlayerMission = {}
	setmetatable(newPlayerMission, PlayerMission)
	--newPlayerMission.mission = mission
	newPlayerMission.name = config.mission_name
	newPlayerMission.clear = config.mission_clear_flag
	newPlayerMission.mission_stage = config.mission_stage
	newPlayerMission.MissionEnd = MissionEnd
	print("end make PlayerMission")
	--newPlayerMission:Init(input)
	return newPlayerMission
end

function PlayerMission:setMissionClear(value:boolean)
	self.clear = value
	
	-- 09-29 추가
	if self:isMissionClear() then
		self.MissionEnd:Fire(self)
		--self:removeStage()
	end
end

function PlayerMission:isMissionClear()
	return self.clear
end

-- 09-29 추가
function PlayerMission:removeStage()
	if self.mission_stage ~= nil then
		self.mission_stage:Destroy()
	end
end

--function PlayerMission:Init(missions:table)
--	for i, v in pairs(missions) do		
--		self[i] = v
--	end
--end

--function PlayerMission:checkMissionCompleteThisWeek(activityName:string, complete:table, weekName:string)
--	if self.clear then
--		if complete[weekName] == nil then
--			complete[weekName] ={}
--		end
--		complete[weekName][activityName] = self
--	end
--end

--function PlayerMission:checkMissionCompletePastWeek(activityName:string, complete:table, incomplete:table, weekName:string)
--	if self.clear then
--		if complete[weekName] ==nil then
--			complete[weekName] ={}
--		end
--		complete[weekName][activityName] = self
--	else
--		if incomplete[weekName] ==nil then
--			incomplete[weekName] ={}
--		end
--		incomplete[weekName][activityName] = self
--	end
--end

return PlayerMission
