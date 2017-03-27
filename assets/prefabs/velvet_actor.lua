local Class = require 'middleclass'
local Vector = require (RODA_LIB .. 'hump.vector')
local Actor = require (RODA_SRC .. 'core.actor')
local Process = require (RODA_SRC .. 'core.process')
local RigidbodyComponent = require (RODA_SRC .. 'component.rigidbody')
local SpriteComponent = require (RODA_SRC .. 'component.sprite')
local TransformComponent = require (RODA_SRC .. 'component.transform')

local velvet_actor = Class('VelvetActor', Actor)

function velvet_actor:initialize(position)
	Actor.initialize(self, 'Velvet')

	self:add_component('transform', TransformComponent(position))
	self:add_component('sprite', SpriteComponent('assets/images/Velvet.png', 32, 32, 0))
	self:add_component('rigidbody', RigidbodyComponent(16, 32))
end

-- FIXME This doesnt work anymore
--[[function velvet:on_add()
	local walk = Process()
	walk.on_update = function (dt)
		self.bus:emit('physics/translate', self, Vector(-50, 0))

		if self.transform.position.x <= 0 then
			walk:succeed()
		end
	end

	local meh = Process()
	meh.on_update = function (dt)
		self.bus:emit('physics/translate', self, Vector(0, -400))

		if self.transform.position.y <= -100 then
			meh:succeed()
		end
	end

	local back = Process()
	back.on_update = function (dt)
		self.bus:emit('physics/translate', self, Vector(50, 0))

		if self.transform.position.x >= 50 then
			back:succeed()
		end
	end

	walk:attach(meh)
	meh:attach(back)
	self.bus:emit('process/attach', walk)
end]]

return velvet_actor
