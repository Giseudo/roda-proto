local Class = require 'middleclass'
local Actor = require (RODA_SRC .. 'core.actor')
local RigidbodyComponent = require (RODA_SRC .. 'component.rigidbody')
local TransformComponent = require (RODA_SRC .. 'component.transform')

local floor_actor = Class('Floor', Actor)

function floor_actor:initialize(position, width, height)
	Actor.initialize(self, 'Floor')

	self.transform = TransformComponent(position)
	self.rigidbody = RigidbodyComponent(width, height)
	self.rigidbody.kinematic = true
end

return floor_actor
