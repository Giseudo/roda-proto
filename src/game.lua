local Vector = require (RODA_LIB .. 'hump.vector')
local RenderSystem = require (RODA_SRC .. 'system.render')
local PlayerSystem = require (RODA_SRC .. 'system.player')
local InputSystem = require (RODA_SRC .. 'system.input')
local PhysicsSystem = require (RODA_SRC .. 'system.physics')

local B2 = require (GAME_SRC .. 'entity.b2')
local Velvet = require (GAME_SRC .. 'entity.velvet')
local Floor = require (GAME_SRC .. 'entity.floor')

local game = {}

function game:new(engine)
	-- Init systems
	engine.bus:emit('world/add', RenderSystem(engine.bus))
	engine.bus:emit('world/add', PlayerSystem(engine.bus))
	engine.bus:emit('world/add', PhysicsSystem(engine.bus))
	engine.bus:emit('world/add', InputSystem(engine.bus))

	-- Add entites to world
	engine.bus:emit('world/add', B2(engine.bus, Vector(0, 0)))
	engine.bus:emit('world/add', Floor(engine.bus, Vector(0, 70), 500, 20))
	engine.bus:emit('world/add', Velvet(engine.bus, Vector(-100, -50)))

	-- Set physics gravity
	engine.bus:emit('physics/gravity/set', Vector(0, 300))

	return self
end

function game:update(dt)
end

function game:draw()
end

return setmetatable(game, { __call = game.new })
