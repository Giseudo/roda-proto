local Class = require 'middleclass'
local Vector = require (RODA_LIB .. 'hump.vector')
local GameObject = require (RODA_SRC .. 'core.game_object')
local Process = require (RODA_SRC .. 'core.process')
local Rigidbody = require (RODA_SRC .. 'component.rigidbody')
local Sprite = require (RODA_SRC .. 'component.sprite')
local Transform = require (RODA_SRC .. 'component.transform')

local velvet = Class('Velvet', GameObject)

function velvet:initialize(bus, position)
	GameObject.initialize(self, bus, 'Velvet')

	self:add_component('transform', Transform(position))
	self:add_component('sprite', Sprite('assets/images/Velvet.png', 32, 32, 0))
	self:add_component('rigidbody', Rigidbody(16, 32))
end

-- FIXME This doesnt work anymore
function velvet:on_add()
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
end

return velvet
