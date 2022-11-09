-- main path
local ReplicatedStorageActivityFolder = game.ReplicatedStorage.Activity

-- sub path
local stageClass = require(ReplicatedStorageActivityFolder.Scripts.Stage)
local missionClass = require(ReplicatedStorageActivityFolder.Scripts.Mission)
local stage = script.Parent


local mission1 = stage.mission1
local satge1 = stageClass.new(stage)

