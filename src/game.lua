local Class = require (LIB_PATH .. "hump.class")

local Game = Class{
	bus = nil
}

function Game:init(bus)
	print("Init: Game")
	self.bus = bus
end

function Game:update(dt)
	print("Update: Game")
end

return Game
