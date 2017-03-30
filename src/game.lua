local Vector = require (RODA_LIB .. 'hump.vector')
local RenderSystem = require (RODA_SRC .. 'system.render')
local PlayerSystem = require (RODA_SRC .. 'system.player')
local InputSystem = require (RODA_SRC .. 'system.input')
local PhysicsSystem = require (RODA_SRC .. 'system.physics')

local AndroidActor = require (GAME_ASSETS .. 'prefabs.android_actor')
local VelvetActor = require (GAME_ASSETS .. 'prefabs.velvet_actor')
local FloorActor = require (GAME_ASSETS .. 'prefabs.floor_actor')

game = {}

function game:initialize()
	local android = AndroidActor(Vector(0, 0));

	-- Init systems
	roda.bus:emit('world/add', RenderSystem())
	roda.bus:emit('world/add', PlayerSystem())
	roda.bus:emit('world/add', PhysicsSystem())
	roda.bus:emit('world/add', InputSystem())

	-- Add entites to world
	roda.bus:emit('world/add', android)
	roda.bus:emit('world/add', FloorActor(Vector(0, 70), 500, 20))
	roda.bus:emit('world/add', VelvetActor(Vector(-100, -50)))

	-- Set world target pawn
	roda.bus:emit('world/pawn', android)

	-- Set physics gravity
	roda.bus:emit('physics/gravity/set', Vector(0, 300))

	return self
end

function game:update(dt)
end

function game:draw()
end
