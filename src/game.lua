local Class = require (LIB_PATH .. "hump.class")
local Vector = require (LIB_PATH .. "hump.vector")
local Button = require (RODA_PATH .. "gui.button")

local Game = Class{
	bus = nil,
	button = {}
}

function Game:init(bus)
	self.bus = bus

	self.button = Button(Vector(0, 0), 100, 20)

	self.bus:subscribe("update", function(message) self:update(message) end)
	self.bus:subscribe("camera/gui/draw", function(message) self:draw(message) end)
	self.bus:subscribe("input/key-press", function(message) self:keyPress(message) end)
	self.bus:subscribe("input/key-up", function(message) self:keyUp(message) end)
end

function Game:update(message)
end

function Game:draw()
	self.button:draw()
end

function Game:keyPress(message)
	print("Player pressed:" .. message.key)
end

function Game:keyUp(message)
	print("Player released:" .. message.key)
end

return Game
