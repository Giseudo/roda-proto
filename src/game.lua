-- Systems
local CollisionSystem = require (RODA_SRC .. 'system.collision')
local CollisionDebugSystem = require (RODA_SRC .. 'system.collision_debug')
local MovementSystem = require (RODA_SRC .. 'system.movement')
local GravitySystem = require (RODA_SRC .. 'system.gravity')
local RenderSystem = require (RODA_SRC .. 'system.render')
local AnimationSystem = require (RODA_SRC .. 'system.animation')
local TilemapSystem = require (RODA_SRC .. 'system.tilemap')
local TilemapDebugSystem = require (RODA_SRC .. 'system.tilemap_debug')

-- Entities
local Player = require (RODA_SRC .. 'entity.player')
local B2 = require (RODA_SRC .. 'entity.b2')
local Grid = require (RODA_SRC .. 'entity.grid')
local Tile = require (RODA_SRC .. 'entity.tile')

Game = {}

function Game:run()
	Roda.physics.gravity = Vector(0.0, -0.7)

	Roda.resources:load_shader('default', 'default/vertex.glsl', 'default/fragment.glsl')
	Roda.resources:load_shader('blink', 'default/vertex.glsl', 'blink/fragment.glsl')
	Roda.resources:load_shader('outline', 'default/vertex.glsl', 'outline/fragment.glsl')
	Roda.resources:load_shader('glitch', 'default/vertex.glsl', 'glitch/fragment.glsl')

	-- Create entities
	self.player = Player(Vector(0, 0), Vector(16, 32))
	self.b2 = B2(Vector(10, 0), Vector(16, 32))
	self.grid = Grid(8, 8, 0)

	-- Add systems
	Roda.world:addSystem(GravitySystem())
	Roda.world:addSystem(MovementSystem())
	Roda.world:addSystem(CollisionSystem())
	Roda.world:addSystem(CollisionDebugSystem())
	Roda.world:addSystem(RenderSystem())
	Roda.world:addSystem(AnimationSystem())
	Roda.world:addSystem(TilemapSystem())
	Roda.world:addSystem(TilemapDebugSystem())

	-- Add entities
	Roda.world:addEntity(self.player)
	Roda.world:addEntity(self.b2)
	Roda.world:addEntity(self.grid)
	Roda.world:refresh()

	Roda.bus:emit('tilemap/add', Tile('assets/images/terrain_01.png', 0, 5, 0))
	Roda.bus:emit('tilemap/add', Tile('assets/images/terrain_01.png', 1, 5, 0))
	Roda.bus:emit('tilemap/add', Tile('assets/images/terrain_01.png', 2, 5, 0))
	Roda.bus:emit('tilemap/add', Tile('assets/images/terrain_01.png', 3, 5, 0))
	Roda.bus:emit('tilemap/add', Tile('assets/images/terrain_01.png', 4, 5, 0))
	Roda.bus:emit('tilemap/add', Tile('assets/images/terrain_01.png', 5, 5, 0))
	Roda.bus:emit('tilemap/add', Tile('assets/images/terrain_01.png', 6, 5, 0))
	Roda.bus:emit('tilemap/add', Tile('assets/images/terrain_01.png', 7, 5, 0))
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

		if key == "t" then
			Roda.bus:emit('tilemap/add', Tile('assets/images/terrain_01.png', 0, 0, 0))
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
