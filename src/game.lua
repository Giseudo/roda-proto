-- Systems
local CollisionSystem = require (RODA_SRC .. 'system.collision')
local CollisionDebugSystem = require (RODA_SRC .. 'system.collision_debug')
local MovementSystem = require (RODA_SRC .. 'system.movement')
local GravitySystem = require (RODA_SRC .. 'system.gravity')
local RenderSystem = require (RODA_SRC .. 'system.render')
local AnimationSystem = require (RODA_SRC .. 'system.animation')
local PlayerSystem = require (RODA_SRC .. 'system.player')
local TilemapSystem = require (RODA_SRC .. 'system.tilemap')
local TilemapDebugSystem = require (RODA_SRC .. 'system.tilemap_debug')

-- Entities
local Grid = require (RODA_SRC .. 'entity.grid')
local Tile = require (RODA_SRC .. 'entity.tile')
local Dummy = require (GAME_SRC .. 'entity.dummy')
local B2 = require (GAME_SRC .. 'entity.b2')

Game = {}

function Game:run()
	Roda.physics.gravity = Vector(0.0, -0.65)

	Roda.resources:load_shader('default', 'default/vertex.glsl', 'default/fragment.glsl')
	Roda.resources:load_shader('blink', 'default/vertex.glsl', 'blink/fragment.glsl')
	Roda.resources:load_shader('outline', 'default/vertex.glsl', 'outline/fragment.glsl')
	Roda.resources:load_shader('glitch', 'default/vertex.glsl', 'glitch/fragment.glsl')

	-- Create entities
	self.dummy = Dummy(Vector(0, 0), Vector(16, 32))
	self.b2 = B2(Vector(10, 0), Vector(16, 32))
	self.grid = Grid(8, 8, 0)

	self.dummy.controller.player = true

	-- Add systems
	Roda.world:addSystem(GravitySystem())
	Roda.world:addSystem(MovementSystem())
	Roda.world:addSystem(CollisionSystem())
	Roda.world:addSystem(CollisionDebugSystem())
	Roda.world:addSystem(RenderSystem())
	Roda.world:addSystem(AnimationSystem())
	Roda.world:addSystem(PlayerSystem())
	Roda.world:addSystem(TilemapSystem())
	Roda.world:addSystem(TilemapDebugSystem())

	-- Add entities
	Roda.world:addEntity(self.dummy)
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

	Roda.bus:emit('tilemap/add', Tile('assets/images/terrain_01.png', 2, 6, 0))
	Roda.bus:emit('tilemap/add', Tile('assets/images/terrain_01.png', 3, 6, 0))
	Roda.bus:emit('tilemap/add', Tile('assets/images/terrain_01.png', 4, 6, 0))
	Roda.bus:emit('tilemap/add', Tile('assets/images/terrain_01.png', 5, 6, 0))
end

function Game:update(dt)
end

function Game:draw()
end
