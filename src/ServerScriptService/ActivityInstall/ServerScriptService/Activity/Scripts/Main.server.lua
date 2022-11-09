-- main path
local ReplicatedStorageActivityFolder = game.ReplicatedStorage.Activity
local WorkspaceActivityFolder = game.Workspace.Activity

-- sub path
--local ActivityClass = require(ReplicatedStorageActivityFolder.Scripts.Activity)
--local ActivityManagerClass = require(ReplicatedStorageActivityFolder.Scripts.ActivityManager)
local WeeksModel = WorkspaceActivityFolder.Asset:GetChildren()
local Week1_ActivityBook1_Stage1_mission1_Script = ReplicatedStorageActivityFolder.Scripts.Weeks.Week1.ActivityBook1.Act1.mission1
local Week1_ActivityBook1_Stage1_mission2_Script = ReplicatedStorageActivityFolder.Scripts.Weeks.Week1.ActivityBook1.Act1.mission2
local Week1_ActivityBook1_Stage2_mission1_Script = ReplicatedStorageActivityFolder.Scripts.Weeks.Week1.ActivityBook1.Act2.mission1
local Week1_ActivityBook1_Stage2_mission2_Script = ReplicatedStorageActivityFolder.Scripts.Weeks.Week1.ActivityBook1.Act2.mission2
local Week1_ActivityBook2_Stage1_mission1_Script = ReplicatedStorageActivityFolder.Scripts.Weeks.Week1.ActivityBook2.Act1.mission1
local Week1_ActivityBook2_Stage1_mission2_Script = ReplicatedStorageActivityFolder.Scripts.Weeks.Week1.ActivityBook2.Act1.mission2
local Week1_ActivityBook2_Stage2_mission1_Script = ReplicatedStorageActivityFolder.Scripts.Weeks.Week1.ActivityBook2.Act2.mission1
local Week1_ActivityBook2_Stage2_mission2_Script = ReplicatedStorageActivityFolder.Scripts.Weeks.Week1.ActivityBook2.Act2.mission2
local Week2_ActivityBook1_Stage1_mission1_Script = ReplicatedStorageActivityFolder.Scripts.Weeks.Week2.ActivityBook1.Act1.mission1
local Week2_ActivityBook1_Stage1_mission2_Script = ReplicatedStorageActivityFolder.Scripts.Weeks.Week2.ActivityBook1.Act1.mission2
local Week2_ActivityBook1_Stage2_mission1_Script = ReplicatedStorageActivityFolder.Scripts.Weeks.Week2.ActivityBook1.Act2.mission1
local Week2_ActivityBook1_Stage2_mission2_Script = ReplicatedStorageActivityFolder.Scripts.Weeks.Week2.ActivityBook1.Act2.mission2
local Week2_ActivityBook2_Stage1_mission1_Script = ReplicatedStorageActivityFolder.Scripts.Weeks.Week2.ActivityBook2.Act1.mission1
local Week2_ActivityBook2_Stage1_mission2_Script = ReplicatedStorageActivityFolder.Scripts.Weeks.Week2.ActivityBook2.Act1.mission2
local Week2_ActivityBook2_Stage2_mission1_Script = ReplicatedStorageActivityFolder.Scripts.Weeks.Week2.ActivityBook2.Act2.mission1
local Week2_ActivityBook2_Stage2_mission2_Script = ReplicatedStorageActivityFolder.Scripts.Weeks.Week2.ActivityBook2.Act2.mission2


--local Week1_ActivityBook1_Stage1_Script = ReplicatedStorageActivityFolder.Scripts.Stage1.stage1
---
local WeekPlaceMove = ReplicatedStorageActivityFolder.Asset.Event.WeekPlaceMove
local MissionClear = ReplicatedStorageActivityFolder.Asset.Event.MissionClear
local MissionEnd = ReplicatedStorageActivityFolder.Asset.Event.MissionEnd

WeekPlaceMove.OnServerEvent:Connect(function(player, location)
	player.Character:MoveTo(location)
end)

--Instance.new("BindableEvent")
MissionEnd.Event:Connect(function(player, path)
	print(player,path)
	MissionClear:FireClient(player, path)
end)

Week1_ActivityBook1_Stage1_mission1_Script.Parent = WorkspaceActivityFolder.Asset.Week1.ActivityBook1.Act1.mission1
Week1_ActivityBook1_Stage1_mission2_Script.Parent = WorkspaceActivityFolder.Asset.Week1.ActivityBook1.Act1.mission2
Week1_ActivityBook1_Stage2_mission1_Script.Parent = WorkspaceActivityFolder.Asset.Week1.ActivityBook1.Act2.mission1
Week1_ActivityBook1_Stage2_mission2_Script.Parent = WorkspaceActivityFolder.Asset.Week1.ActivityBook1.Act2.mission2
Week1_ActivityBook2_Stage1_mission1_Script.Parent = WorkspaceActivityFolder.Asset.Week1.ActivityBook2.Act1.mission1
Week1_ActivityBook2_Stage1_mission2_Script.Parent = WorkspaceActivityFolder.Asset.Week1.ActivityBook2.Act1.mission2
Week1_ActivityBook2_Stage2_mission1_Script.Parent = WorkspaceActivityFolder.Asset.Week1.ActivityBook2.Act2.mission1
Week1_ActivityBook2_Stage2_mission2_Script.Parent = WorkspaceActivityFolder.Asset.Week1.ActivityBook2.Act2.mission2
Week2_ActivityBook1_Stage1_mission1_Script.Parent = WorkspaceActivityFolder.Asset.Week2.ActivityBook1.Act1.mission1
Week2_ActivityBook1_Stage1_mission2_Script.Parent = WorkspaceActivityFolder.Asset.Week2.ActivityBook1.Act1.mission2
Week2_ActivityBook1_Stage2_mission1_Script.Parent = WorkspaceActivityFolder.Asset.Week2.ActivityBook1.Act2.mission1
Week2_ActivityBook1_Stage2_mission2_Script.Parent = WorkspaceActivityFolder.Asset.Week2.ActivityBook1.Act2.mission2
Week2_ActivityBook2_Stage1_mission1_Script.Parent = WorkspaceActivityFolder.Asset.Week2.ActivityBook2.Act1.mission1
Week2_ActivityBook2_Stage1_mission2_Script.Parent = WorkspaceActivityFolder.Asset.Week2.ActivityBook2.Act1.mission2
Week2_ActivityBook2_Stage2_mission1_Script.Parent = WorkspaceActivityFolder.Asset.Week2.ActivityBook2.Act2.mission1
Week2_ActivityBook2_Stage2_mission2_Script.Parent = WorkspaceActivityFolder.Asset.Week2.ActivityBook2.Act2.mission2


print(WeeksModel)

--local Stage1 = ReplicatedStorageActivityFolder.Asset.Stages.Stage1
--local entrance = Vector3.new(0,0,0)
--local stageScript = ReplicatedStorageActivityFolder.Scripts.Stages.Stage1.stage
--local mission1 = ReplicatedStorageActivityFolder.Scripts.Stages.Stage1.mission1
--local mission2 = ReplicatedStorageActivityFolder.Scripts.Stages.Stage1.mission2

--local Stage2 = ReplicatedStorageActivityFolder.Asset.Stages.Stage2
--local stageScript2 = ReplicatedStorageActivityFolder.Scripts.Stages.Stage2.stage
--local mission2_1 = ReplicatedStorageActivityFolder.Scripts.Stages.Stage2.mission1
--local mission2_2 = ReplicatedStorageActivityFolder.Scripts.Stages.Stage2.mission2

--local testtable = {}
--testtable["FindCoin"] = {
--	["id"] = 1,
--	["name"] = "FindCoin",
--	["stage"]= Stage1,
--	["entrance"] = entrance,
--	["stageScript"] = stageScript,
--	["missions"] = {
--		mission1,
--		mission2
--	}
--}

--testtable["FindCoin2"] = {
--	["id"] = 2,
--	["name"] = "FindCoin2",
--	["stage"]= Stage2,
--	["entrance"] = entrance,
--	["stageScript"] = stageScript2,
--	["missions"] = {
--		mission2_1,
--		mission2_2
--	}
--}
--local ActivityManager = ActivityManagerClass.new(testtable)

--print(ActivityManager:getActivities())
--wait(10)
--ActivityManager:start(game.Players.lanla1a1,1)

--wait(30)
--ActivityManager:start(game.Players.lanla1a1,2)
