local GameObject = require (RODA_PATH .. "core.game_object")
local Animation = require (RODA_PATH .. "core.animation")
local Character = require (RODA_PATH .. "components.character")
local Rigidbody = require (RODA_PATH .. "components.rigidbody")
local Sprite = require (RODA_PATH .. "components.sprite")
local Transform = require (RODA_PATH .. "components.transform")
local Device = require (RODA_PATH .. "components.device")
local Animator = require (RODA_PATH .. "components.animator")

-- Entity below
local android = {}

function android:new(bus, position)
	setmetatable(self,
		{ __index = GameObject(bus, "B2") }
	)

	-- Add components
	self:add_component("transform", Transform(position))
	self:add_component("character", Character("Android Series B2"))
	self:add_component("sprite", Sprite("assets/images/B2.png", 32, 32, 0))
	self:add_component("rigidbody", Rigidbody(16, 32))
	self:add_component("device", Device)
	self:add_component("animator", Animator("idle", 0, 6, 0.1))

	-- Add animations
	self.animator:add("run", 7, 14, 0.1)

	return self
end

local android_factory = {
	components = {
		transform = Transform(position),
		character = Character("Android Series B2"),
		sprite = Sprite("assets/images/B2.png", 32, 32, 0),
		rigidbody = Rigidbody(16, 32),
		device = Device,
		animator = Animator("idle")
	},
	listening = {
		scene = {
			update = function(e, dt)
			end
		},
		physics = {
			collision = function(e, second, dt)
			end
		}
	},
	states = {
		idle = {
			enter = function(e)
				print("enter idle state")
			end,
			update = function(e, dt)
				e.state:next("moving")
			end,
			exit = function(e)
				print("exit idle state")
			end
		}
	},
	animations = {
		idle = Animation(0, 6, 0.1),
		run = Animation(7, 14, 0.1)
	}
}

return setmetatable(android,
	{ __call = android.new }
)
