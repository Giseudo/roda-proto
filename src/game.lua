local Class = require (LIB_PATH .. "hump.class")

local Game = Class{
	bus = nil
}

function Game:init(bus)
	self.bus = bus

	self.bus:subscribe("update", function(event) self:update(event) end)
	self.bus:subscribe("draw", function(event) self:draw(event) end)
	self.bus:subscribe("input/key-press", function(event) self:keyPress(event) end)
	self.bus:subscribe("input/key-up", function(event) self:keyUp(event) end)
end

function Game:update(event)
end

function Game:draw()
end

function Game:keyPress(event)
	print("Player pressed:" .. event.key)
end

function Game:keyUp(event)
	print("Player released:" .. event.key)
end

return Game
