local Vector = require (RODA_LIB .. 'hump.vector')
local RenderSystem = require (RODA_SRC .. 'system.render')
local SceneSystem = require (RODA_SRC .. 'system.scene')
local PlayerSystem = require (RODA_SRC .. 'system.player')
local InputSystem = require (RODA_SRC .. 'system.input')
local PhysicsSystem = require (RODA_SRC .. 'system.physics')

local B2 = require (GAME_SRC .. 'entity.b2')
local Velvet = require (GAME_SRC .. 'entity.velvet')
local Forest = require (GAME_SRC .. 'entity.forest')
local Floor = require (GAME_SRC .. 'entity.floor')

local game = {}

function game:new(engine)
	local player = B2(engine.bus, Vector(0, 0))
	local level = Forest(engine.bus, Vector(0, 0))
	local floor = Floor(engine.bus, Vector(0, 70), 500, 20)

	engine:add_system('render', RenderSystem(engine.bus))

	-- Init systems
	--engine.bus:emit('system/add', 'render', RenderSystem:new(engine.bus))
	engine.bus:emit('system/add', 'scene', SceneSystem(engine.bus))
	engine.bus:emit('system/add', 'player', PlayerSystem(engine.bus))
	engine.bus:emit('system/add', 'physics', PhysicsSystem(engine.bus))
	engine.bus:emit('system/add', 'input', InputSystem(engine.bus))

	-- Add entites to scene
	engine.bus:emit('scene/add', player)
	engine.bus:emit('scene/add', level)
	engine.bus:emit('scene/add', floor)
	engine.bus:emit('scene/add', Velvet(engine.bus, Vector(-100, -50)))

	-- Set physics gravity
	engine.bus:emit('physics/gravity/set', Vector(0, 300))

	return self
end

function game:update(dt)
end

function game:draw()
end

return setmetatable(game, { __call = game.new })
