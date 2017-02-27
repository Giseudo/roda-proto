local Class = require (LIB_PATH .. "hump.class")
local Vector = require (LIB_PATH .. "hump.vector")

local RenderSystem = require (RODA_PATH .. "systems.render")
local DebugSystem = require (RODA_PATH .. "systems.debug")
local PlayerSystem = require (RODA_PATH .. "systems.player")
local InputSystem = require (RODA_PATH .. "systems.input")
local PhysicsSystem = require (RODA_PATH .. "systems.physics")

local B2 = require (RODA_PATH .. "entities.b2")
local Velvet = require (RODA_PATH .. "entities.velvet")
local Forest = require (RODA_PATH .. "entities.forest")
local Floor = require (RODA_PATH .. "entities.floor")

local Game = Class{}

function Game:init(engine)
	engine.bus:emit("system/add", "render", RenderSystem:new(engine.bus))
	engine.bus:emit("system/add", "player", PlayerSystem:new(engine.bus))
	engine.bus:emit("system/add", "debug", DebugSystem:new(engine.bus))
	engine.bus:emit("system/add", "input", InputSystem:new(engine.bus))
	engine.bus:emit("system/add", "physics", PhysicsSystem:new(engine.bus))

	local enemy = Velvet(Vector(100, 0))
	local player = B2(Vector(0, 0))
	local level = Forest(Vector(0, 0))
	local floor = Floor(Vector(0, 70), 500, 20)

	engine.bus:emit("entity/add", enemy)
	engine.bus:emit("entity/add", player)
	engine.bus:emit("entity/add", level)
	engine.bus:emit("entity/add", floor)
	engine.bus:emit("physics/gravity/set", Vector(0, 400))
end

function Game:update(message)
end

function Game:draw()
end

return Game
