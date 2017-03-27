local Vector = require (RODA_LIB .. 'hump.vector')
local RenderSystem = require (RODA_SRC .. 'system.render')
local PlayerSystem = require (RODA_SRC .. 'system.player')
local InputSystem = require (RODA_SRC .. 'system.input')
local PhysicsSystem = require (RODA_SRC .. 'system.physics')

local AndroidActor = require (GAME_ASSETS .. 'prefabs.android_actor')
local VelvetActor = require (GAME_ASSETS .. 'prefabs.velvet_actor')
local FloorActor = require (GAME_ASSETS .. 'prefabs.floor_actor')

local game = {}

function game:new()
	local android = AndroidActor(Vector(0, 0));

	-- Init systems
	Roda.bus:emit('world/add', RenderSystem())
	Roda.bus:emit('world/add', PlayerSystem())
	Roda.bus:emit('world/add', PhysicsSystem())
	Roda.bus:emit('world/add', InputSystem())

	-- Add entites to world
	Roda.bus:emit('world/add', android)
	Roda.bus:emit('world/add', FloorActor(Vector(0, 70), 500, 20))
	Roda.bus:emit('world/add', VelvetActor(Vector(-100, -50)))

	-- Set world target pawn
	Roda.bus:emit('world/pawn', android)

	-- Set physics gravity
	Roda.bus:emit('physics/gravity/set', Vector(0, 300))

	return self
end

function game:update(dt)
end

function game:draw()
end

return setmetatable(game, { __call = game.new })
