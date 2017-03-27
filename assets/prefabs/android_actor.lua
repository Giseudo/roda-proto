local Class = require 'middleclass'
local Camera = require (RODA_LIB .. 'hump.camera')
local CharacterPawn = require (RODA_SRC .. 'core.actor.pawn.character')
local Animation = require (RODA_SRC .. 'core.animation')
local CharacterComponent = require (RODA_SRC .. 'component.character')
local RigidbodyComponent = require (RODA_SRC .. 'component.rigidbody')
local SpriteComponent = require (RODA_SRC .. 'component.sprite')
local TransformComponent = require (RODA_SRC .. 'component.transform')
local ControllerComponent = require (RODA_SRC .. 'component.controller')
local AnimatorComponent = require (RODA_SRC .. 'component.animator')

local android_actor = Class('AndroidActor', CharacterPawn)

function android_actor:initialize(position)
	CharacterPawn.initialize(self, Camera(0, 0, 2))

	-- Add components
	self:add_component('transform', TransformComponent(position))
	self:add_component('character', CharacterComponent('Android Series B2'))
	self:add_component('sprite', SpriteComponent('assets/images/B2.png', 32, 32, 0))
	self:add_component('rigidbody', RigidbodyComponent(16, 32))
	self:add_component('controller', ControllerComponent())
	self:add_component('animator', AnimatorComponent('idle', Animation(0, 6)))

	-- Add animations
	self.animator:add('run', Animation(7, 14))
end

--[[local android_factory = {
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
}]]

return android_actor
