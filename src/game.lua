-- Systems
local CollisionSystem = require (RODA_SRC .. 'system.collision')
local CollisionDebugSystem = require (RODA_SRC .. 'system.collision_debug')
local MovementSystem = require (RODA_SRC .. 'system.movement')
local GravitySystem = require (RODA_SRC .. 'system.gravity')
local RenderSystem = require (RODA_SRC .. 'system.render')
local AnimationSystem = require (RODA_SRC .. 'system.animation')

-- Entities
local Player = require (RODA_SRC .. 'entity.player')
local Platform = require (RODA_SRC .. 'entity.platform')

Game = {}

function Game:run()
	Roda.physics.gravity = Vector(0.0, -0.7)

	Roda.resources:load_shader('default', 'default/vertex.glsl', 'default/fragment.glsl')
	Roda.resources:load_shader('blink', 'default/vertex.glsl', 'blink/fragment.glsl')
	Roda.resources:load_shader('outline', 'default/vertex.glsl', 'outline/fragment.glsl')

	-- Create entities
	self.player = Player(Vector(0, 0), Vector(16, 32))
	self.platform1 = Platform(Vector(0, -8), Vector(512, 16))
	self.platform2 = Platform(Vector(256, 56), Vector(512, 16))

	-- Add systems
	Roda.world:addSystem(GravitySystem())
	Roda.world:addSystem(MovementSystem())
	Roda.world:addSystem(CollisionSystem())
	Roda.world:addSystem(CollisionDebugSystem())
	Roda.world:addSystem(RenderSystem())
	Roda.world:addSystem(AnimationSystem())

	-- Add entities
	Roda.world:addEntity(self.player)
	Roda.world:addEntity(self.platform1)
	Roda.world:addEntity(self.platform2)
end

function Game:update(dt)
	self:events()
end

function Game:events()
	function love.keypressed(key)
		-- Player jump
		if key == "space" then
			self.player:jump()
		end

		-- Camera inputs
		if love.keyboard.isDown("z") then
			Roda.camera:zoom(1)
		end
		if love.keyboard.isDown("x") then
			Roda.camera:zoom(-1)
		end

		-- Debug
		if key == "d" and Roda.debug then
			Roda.debug = false
		elseif key == "d" and Roda.debug ~= true then
			Roda.debug = true
		end
	end

	-- Player movement
	if love.keyboard.isDown("left") then
		self.player.controller:move_left()
	end
	if love.keyboard.isDown("right") then
		self.player.controller:move_right()
	end
	if love.keyboard.isDown("down") then
		self.player.controller:move_down()
	end
	if love.keyboard.isDown("up") then
		self.player.controller:move_up()
	end
end

function Game:draw()
end
