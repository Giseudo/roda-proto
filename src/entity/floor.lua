local Class = require 'middleclass'
local GameObject = require (RODA_SRC .. 'core.game_object')
local Rigidbody = require (RODA_SRC .. 'component.rigidbody')
local Transform = require (RODA_SRC .. 'component.transform')

local floor = Class('Floor')

function floor:initialize(bus, position, width, height)
	GameObject.initialize(self, bus, 'Floor')

	self.transform = Transform(position)
	self.rigidbody = Rigidbody(width, height)
	self.rigidbody.kinematic = true
end

return floor
