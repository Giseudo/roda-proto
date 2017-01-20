local Class = require (LIB_PATH .. "hump.class")

local Game = Class{
	bus = nil
}

function Game:init(bus)
	self.bus = bus

	self.bus:subscribe("input/key-up", function(payload) self:onKeyUp(payload) end)
end

function Game:update(dt)
end

function Game:onKeyUp(payload)
	print("Player pressed: " .. payload)
end

return Game
