local Class = require 'middleclass'
local Camera = require (RODA_LIB .. 'hump.camera')
local Transform = require (RODA_SRC .. 'component.transform')
local GameObject = require (RODA_SRC .. 'core.game_object')

local forest = Class('Forest')

function forest:initialize(bus, position)
	GameObject.initialize(self, bus, 'Forest')

	self.camera = Camera(position.x, position.y, 2)
	self.transform = Transform(position)
	self.name = 'forest'
end

return forest
