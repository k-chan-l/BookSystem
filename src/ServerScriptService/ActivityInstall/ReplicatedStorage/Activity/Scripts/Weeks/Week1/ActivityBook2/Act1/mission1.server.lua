-- main path
local ReplicatedStorageActivityFolder = game.ReplicatedStorage.Activity
local Players = game.Players

-- sub path
local stageClass = require(ReplicatedStorageActivityFolder.Scripts.Stage)
local mission = script.Parent
local coin = mission.coin
local missionStart = ReplicatedStorageActivityFolder.Asset.Event.MissionStart
local missionEnd = ReplicatedStorageActivityFolder.Asset.Event.MissionEnd


coin.Touched:Connect(function (hit)
	local player = Players:GetPlayerFromCharacter(hit.Parent)
	if player ~= nil then
		missionEnd:Fire(player, mission.id.Value)
	end
end)
