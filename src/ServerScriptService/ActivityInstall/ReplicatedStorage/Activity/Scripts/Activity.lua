-- main path
local ReplicatedStorageActivityFolder = game.ReplicatedStorage.Activity

-- sub path
local playerDataFunction = ReplicatedStorageActivityFolder.Asset.Function.PlayerData

local Activity = {}
Activity.__index = Activity

function Activity.new(id:int, name:string, stage:Model, entrance:Vector3, stageScript:Script, missions:table)
	print("begin make Activity")
	local newActivity = {}
	setmetatable(newActivity, Activity)
	
	newActivity.id = id
	newActivity.name = name
	newActivity.stage = stage
	newActivity.entrance = entrance
	newActivity.stageScript = stageScript
	newActivity.missions = missions
	
	newActivity:init()
	print("end make Activity")
	return newActivity
end

function Activity:init()
	-- 스테이지 생성 및 스크립트 이동 -> ActivityManager로 이동 예정
	self.stage.Parent = workspace
	self.stageScript.Parent = self.stage
	
	for i, v in pairs(self.missions) do
		v.Parent = self.stage[v.name]
	end
end

function Activity:activityStart(player:Player)
	
	--local userData = playerDataFunction:InvokeClient(player, self.name)
	--print(userData)
	self.stage.StageStart:Fire({player}) -- 스테이지 시작
	self.stage.StageEnd.Event:Connect(function(player) -- 플레이 완료시 받는 함수 -> 수정 예정
		print("Activity:"..player.Name)
		self:activityEnd(player)
	end)
end

function Activity:activityEnd(player)
	player.Character:MoveTo(self.entrance)
end

function Activity:teleportPlayer()
	
end

-- 플레이어 대기 큐에 플레이어 추가


--function Activity:popQueue(index:int)
--	return 
--end

return Activity
