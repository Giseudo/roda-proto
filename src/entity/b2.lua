local Class = require 'middleclass'
local GameObject = require (RODA_SRC .. 'core.game_object')
local Animation = require (RODA_SRC .. 'core.animation')
local Character = require (RODA_SRC .. 'component.character')
local Rigidbody = require (RODA_SRC .. 'component.rigidbody')
local Sprite = require (RODA_SRC .. 'component.sprite')
local Transform = require (RODA_SRC .. 'component.transform')
local Controller = require (RODA_SRC .. 'component.controller')
local Animator = require (RODA_SRC .. 'component.animator')

local android = Class('Android', GameObject)

function android:initialize(bus, position)
	GameObject.initialize(self, bus, 'B2')

	-- Add components
	self:add_component('transform', Transform(position))
	self:add_component('character', Character('Android Series B2'))
	self:add_component('sprite', Sprite('assets/images/B2.png', 32, 32, 0))
	self:add_component('rigidbody', Rigidbody(16, 32))
	self:add_component('controller', Controller())
	self:add_component('animator', Animator('idle', Animation(0, 6)))

	-- Add animations
	self.animator:add('run', Animation(7, 14))
end

local android_factory = {
	components = {
		transform = Transform(position),
		character = Character('Android Series B2'),
		sprite = Sprite('assets/images/B2.png', 32, 32, 0),
		rigidbody = Rigidbody(16, 32),
		device = Device,
		animator = Animator('idle')
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
				print('enter idle state')
			end,
			update = function(e, dt)
				e.state:next('moving')
			end,
			exit = function(e)
				print('exit idle state')
			end
		}
	},
	animations = {
		idle = Animation(0, 6, 0.1),
		run = Animation(7, 14, 0.1)
	}
}

return android
