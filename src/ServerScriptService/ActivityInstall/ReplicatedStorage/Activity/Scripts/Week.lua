-- main path
local ReplicatedStorageActivityFolder = game.ReplicatedStorage.Activity

-- sub path
local ActivityBookClass = require(ReplicatedStorageActivityFolder.Scripts.ActivityBook)

local Week = {}

Week.__index = Week

function Week.new(config:table)
	print("begin make Week")
	local newWeek = {}
	setmetatable(newWeek, Week)
	print("end make Week")
	--newWeek.activityBooks = activityBooks
	
	--newWeek.Stage = Stage
	newWeek.activityBooks = {}
	newWeek.name = config.week_name
	newWeek.week_stage = config.week_stage
	newWeek.clear = config.week_clear_flag
	newWeek:Init(config.actBooks)
	return newWeek
end

function Week:Init(activityBooks)
	for i, v in pairs(activityBooks) do
		print(i, v)
		self.activityBooks[v.name] = v
	end
end

function Week:setWeekClear(key:table, value:boolean)
	self:setActivityBookClear(key, value)

	local flag = true
	for i , v in pairs(self.activityBooks) do
		flag = flag and v:isActivityBookClear()
	end
	self.clear = flag

end

function Week:setActivityBookClear(key:table, value:boolean)
	local path = table.remove(key,1)
	self.activityBooks[path]:setActivityBookClear(key,value)
end

function Week:isWeekClear()
	return self.clear
end

function Week:distributeActivities(weekName:string, currentWeek:int, complete:table, incomplete:table)
	for i, v in pairs(self.activityBooks) do 
		if tonumber(string.split(weekName,"k")[2])==currentWeek then
			v:checkActivityCompleteThisWeek(weekName, complete)
		elseif tonumber(string.split(weekName,"k")[2])>currentWeek then
			break
		else
			v:checkActivityCompletePastWeek(weekName, complete, incomplete)
		end
	end
end

return Week
