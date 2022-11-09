local Mission = {}
Mission.__index = Mission

function Mission.new(activityBooks)
	print("begin make Week")
	local newMission = {}
	setmetatable(newMission, Mission)
	print("end make Activity")
	newMission.activities = activityBooks
	return newMission
end

function Mission:Start()
	
end
return Mission
