-- main path
local Players = game.Players

local Stage = {}
Stage.__index = Stage

function Stage.new(stage:Model)
	print("begin make Week")
	local newStage = {}
	setmetatable(newStage, Stage)
	print("end make Activity")
	newStage.spawnPoint = stage.spawnPoint
	newStage.stageStart = stage.StageStart
	newStage.stageEnd = stage.StageEnd
	newStage.gate = stage.gate
	
	newStage.stageStart.Event:Connect(function(players:table)
		for i,v in pairs(players) do
			v.Character:MoveTo(newStage.spawnPoint.Position)
		end
	end)
	
	newStage.gate.Touched:Connect(function (hit)
		local player = Players:GetPlayerFromCharacter(hit.Parent)
		if player ~= nil then
			print(player)
			newStage.stageEnd:Fire(player)
		end
	end)
	return newStage
end

function Stage:Start()

end

return Stage
