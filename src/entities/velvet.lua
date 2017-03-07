local Class = require (LIB_PATH .. "hump.class")
local Vector = require (LIB_PATH .. "hump.vector")
local GameObject = require (RODA_PATH .. "core.game-object")
local Rigidbody = require (RODA_PATH .. "components.rigidbody")
local Sprite = require (RODA_PATH .. "components.sprite")
local Transform = require (RODA_PATH .. "components.transform")
local Process = require (RODA_PATH .. "components.process")

local Velvet = Class{
	__includes = GameObject
}

function Velvet:init(bus, position)
	GameObject.init(self, "Velvet")

	self.bus = bus
	self.transform = Transform(position)
	self.sprite = Sprite("assets/images/Velvet.png", 32, 32, 0)
	self.rigidbody = Rigidbody(16, 32)
end

function Velvet:onAdd()
	local walk = Process:new()
	walk.onUpdate = function (dt)
		self.bus:emit("physics/translate", self, Vector(-50, 0))

		if self.transform.position.x <= 0 then
			walk:succeed()
		end
	end

	local meh = Process:new()
	meh.onUpdate = function (dt)
		self.bus:emit("physics/translate", self, Vector(0, -400))

		if self.transform.position.y <= -100 then
			meh:succeed()
		end
	end

	local back = Process:new()
	back.onUpdate = function (dt)
		self.bus:emit("physics/translate", self, Vector(50, 0))

		if self.transform.position.x >= 50 then
			back:succeed()
		end
	end

	back.onSuccess = function ()
		back.state = "UNINITIALIZED"
		walk.state = "UNINITIALIZED"
		meh.state = "UNINITIALIZED"
		self.bus:emit("process/attach", walk)
	end

	walk:attach(meh)
	meh:attach(back)
	self.bus:emit("process/attach", walk)
end

return Velvet
