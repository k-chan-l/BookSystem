-- main path
local ReplicatedStorageActivityFolder = game.ReplicatedStorage.Activity
local WorkspaceActivityFolder = game.Workspace.Activity

-- sub path
local BookshelfClass = require(ReplicatedStorageActivityFolder.Scripts.Bookshelf)
local WeekClass = require(ReplicatedStorageActivityFolder.Scripts.Week)
local ActivityBookClass = require(ReplicatedStorageActivityFolder.Scripts.ActivityBook)
local ActClass = require(ReplicatedStorageActivityFolder.Scripts.Act)
local PlayerMissionClass = require(ReplicatedStorageActivityFolder.Scripts.PlayerMission)

-- event path
local LocalManage = ReplicatedStorageActivityFolder.Asset.Event.LocalManage
local WeekPlaceMove = ReplicatedStorageActivityFolder.Asset.Event.WeekPlaceMove
local MissionClear = ReplicatedStorageActivityFolder.Asset.Event.MissionClear
local MissionEnd = ReplicatedStorageActivityFolder.Asset.Event.MissionEnd -- bindableEvent
local ActivityEnd = ReplicatedStorageActivityFolder.Asset.Event.ActivityEnd -- bindableEvent

-- model path
local Week1 = WorkspaceActivityFolder.Asset.Week1

local ActivityBook1 = Week1.ActivityBook1
local Act1 = ActivityBook1.Act1
local mission1 = Act1.mission1
local mission2 = Act1.mission2
local Act2 = ActivityBook1.Act2
local mission3 = Act2.mission1
local mission4 = Act2.mission2

local ActivityBook2 = Week1.ActivityBook2
local Act3 = ActivityBook2.Act1
local mission5 = Act3.mission1
local mission6 = Act3.mission2
local Act4 = ActivityBook2.Act2
local mission7 = Act4.mission1
local mission8 = Act4.mission2

local Week2 = WorkspaceActivityFolder.Asset.Week2

local ActivityBook3 = Week2.ActivityBook1
local Act5 = ActivityBook3.Act1
local mission9 = Act5.mission1
local mission10= Act5.mission2
local Act6 = ActivityBook3.Act2
local mission11= Act6.mission1
local mission12= Act6.mission2

local ActivityBook4 = Week2.ActivityBook2
local Act7 = ActivityBook4.Act1
local mission13= Act7.mission1
local mission14= Act7.mission2
local Act8 = ActivityBook4.Act2
local mission15= Act8.mission1
local mission16= Act8.mission2


mission1_conf={["mission_name"]="mission1", ["mission_clear_flag"]=false, ["mission_stage"]=mission1}
mission2_conf={["mission_name"]="mission2", ["mission_clear_flag"]=false, ["mission_stage"]=mission2}
mission3_conf={["mission_name"]="mission1", ["mission_clear_flag"]=false, ["mission_stage"]=mission3}
mission4_conf={["mission_name"]="mission2", ["mission_clear_flag"]=false, ["mission_stage"]=mission4}
mission5_conf={["mission_name"]="mission1", ["mission_clear_flag"]=false, ["mission_stage"]=mission5}
mission6_conf={["mission_name"]="mission2", ["mission_clear_flag"]=false, ["mission_stage"]=mission6}
mission7_conf={["mission_name"]="mission1", ["mission_clear_flag"]=false, ["mission_stage"]=mission7}
mission8_conf={["mission_name"]="mission2", ["mission_clear_flag"]=false, ["mission_stage"]=mission8}
mission9_conf={["mission_name"]="mission1", ["mission_clear_flag"]=false, ["mission_stage"]=mission9}
mission10_conf={["mission_name"]="mission2", ["mission_clear_flag"]=false, ["mission_stage"]=mission10}
mission11_conf={["mission_name"]="mission1", ["mission_clear_flag"]=false, ["mission_stage"]=mission11}
mission12_conf={["mission_name"]="mission2", ["mission_clear_flag"]=false, ["mission_stage"]=mission12}
mission13_conf={["mission_name"]="mission1", ["mission_clear_flag"]=false, ["mission_stage"]=mission13}
mission14_conf={["mission_name"]="mission2", ["mission_clear_flag"]=false, ["mission_stage"]=mission14}
mission15_conf={["mission_name"]="mission1", ["mission_clear_flag"]=false, ["mission_stage"]=mission15}
mission16_conf={["mission_name"]="mission2", ["mission_clear_flag"]=false, ["mission_stage"]=mission16}

local playerMission1 = PlayerMissionClass.new(mission1_conf)
local playerMission2 = PlayerMissionClass.new(mission2_conf)
local playerMission3 = PlayerMissionClass.new(mission3_conf)
local playerMission4 = PlayerMissionClass.new(mission4_conf)
local playerMission5 = PlayerMissionClass.new(mission5_conf)
local playerMission6 = PlayerMissionClass.new(mission6_conf)
local playerMission7 = PlayerMissionClass.new(mission7_conf)
local playerMission8 = PlayerMissionClass.new(mission8_conf)
local playerMission9 = PlayerMissionClass.new(mission9_conf)
local playerMission10 = PlayerMissionClass.new(mission10_conf)
local playerMission11 = PlayerMissionClass.new(mission11_conf)
local playerMission12 = PlayerMissionClass.new(mission12_conf)
local playerMission13 = PlayerMissionClass.new(mission13_conf)
local playerMission14 = PlayerMissionClass.new(mission14_conf)
local playerMission15 = PlayerMissionClass.new(mission15_conf)
local playerMission16 = PlayerMissionClass.new(mission16_conf)

act1_conf ={ ["act_name"]="Act1", ["id"]=1, ["act_clear_flag"]=false, 
	["playerMissions"] = {playerMission1, playerMission2},["act_stage"] = Act1}
act2_conf ={ ["act_name"]="Act2", ["id"]=2, ["act_clear_flag"]=false, 
	["playerMissions"] = {playerMission3, playerMission4},["act_stage"] = Act2}
act3_conf ={ ["act_name"]="Act1", ["id"]=3, ["act_clear_flag"]=false, 
	["playerMissions"] = {playerMission5, playerMission6},["act_stage"] = Act3}
act4_conf ={ ["act_name"]="Act2", ["id"]=4, ["act_clear_flag"]=false, 
	["playerMissions"] = {playerMission7, playerMission8},["act_stage"] = Act4}
act5_conf ={ ["act_name"]="Act1", ["id"]=5, ["act_clear_flag"]=false, 
	["playerMissions"] = {playerMission9, playerMission10},["act_stage"] = Act5}
act6_conf ={ ["act_name"]="Act2", ["id"]=6, ["act_clear_flag"]=false, 
	["playerMissions"] = {playerMission11, playerMission12},["act_stage"] = Act6}
act7_conf ={ ["act_name"]="Act1", ["id"]=7, ["act_clear_flag"]=false, 
	["playerMissions"] = {playerMission13, playerMission14},["act_stage"] = Act7}
act8_conf ={ ["act_name"]="Act2", ["id"]=8, ["act_clear_flag"]=false, 
	["playerMissions"] = {playerMission15, playerMission16},["act_stage"] = Act8}

local playerAct1 = ActClass.new(act1_conf)
local playerAct2 = ActClass.new(act2_conf)
local playerAct3 = ActClass.new(act3_conf)
local playerAct4 = ActClass.new(act4_conf)
local playerAct5 = ActClass.new(act5_conf)
local playerAct6 = ActClass.new(act6_conf)
local playerAct7 = ActClass.new(act7_conf)
local playerAct8 = ActClass.new(act8_conf)


actBook1_conf = {["actBook_name"] = "ActivityBook1", ["acts"] = {playerAct1, playerAct2}, ["actBook_clear_flag"]=false, ["actvityBook_stage"] = ActivityBook1}
actBook2_conf = {["actBook_name"] = "ActivityBook2", ["acts"] = {playerAct3, playerAct4}, ["actBook_clear_flag"]=false, ["actvityBook_stage"] = ActivityBook2}
actBook3_conf = {["actBook_name"] = "ActivityBook1", ["acts"] = {playerAct5, playerAct6}, ["actBook_clear_flag"]=false, ["actvityBook_stage"] = ActivityBook3}
actBook4_conf = {["actBook_name"] = "ActivityBook2", ["acts"] = {playerAct7, playerAct8}, ["actBook_clear_flag"]=false, ["actvityBook_stage"] = ActivityBook4}

local playerActivityBook1 = ActivityBookClass.new(actBook1_conf)
local playerActivityBook2 = ActivityBookClass.new(actBook2_conf)
local playerActivityBook3 = ActivityBookClass.new(actBook3_conf)
local playerActivityBook4 = ActivityBookClass.new(actBook4_conf)

week1_config = {["week_name"] = "week1", ["actBooks"] = {playerActivityBook1, playerActivityBook2}, ["week_stage"] = Week1, ["week_clear_flag"]=false,}
week2_config = {["week_name"] = "week2", ["actBooks"] = {playerActivityBook3, playerActivityBook4}, ["week_stage"] = Week2, ["week_clear_flag"]=false,}

local playerWeek1 = WeekClass.new(week1_config)
local playerWeek2 = WeekClass.new(week2_config)
--local Week2 = WeekClass.new(testtable.week1.name,{ActivityBook1, ActivityBook2}, Stage2)

LocalManage.Event:Connect(function(sender,message)
	print(sender, message)
	if message == "ChangeCurrent" then
		if sender == nil then
			WeekPlaceMove:FireServer(Vector3.new(0,0,0))
		else
			WeekPlaceMove:FireServer(sender.week_stage.spawnPoint.Position)
		end
	end
end)



local BookShelf = BookshelfClass.new({playerWeek1, playerWeek2})

--BookShelf1:pop()

MissionClear.OnClientEvent:Connect(function(path)
	local key = string.split(path,"/")
	--print(key)
	BookShelf:setWeekClear(key, true)

	--print(BookShelf)
end)

--local Bookshelf = BookshelfClass.new(testtable)
BookShelf.currentWeekChange.Event:Connect(function()
	print("change")
end)

MissionEnd.Event:Connect(function(object)
	setmetatable(object, PlayerMissionClass)
	--print(getmetatable(object))
	object:removeStage()
end)

ActivityEnd.Event:Connect(function(object)
	setmetatable(object, ActClass)
	object:removeStage()
end)



--BookShelf:changeWeek()
print(BookShelf)