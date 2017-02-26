local Class = require (LIB_PATH .. "hump.class")
local Vector = require (LIB_PATH .. "hump.vector")
local B2 = require (RODA_PATH .. "entities.b2")
local Velvet = require (RODA_PATH .. "entities.velvet")

local Game = Class{}

function Game:init(engine)
	local player = B2(Vector(-100, 0))
	local enemy = Velvet(Vector(100, 0))

	engine.world:add(player)
	engine.world:add(enemy)
	engine.world:refresh()
end

function Game:update(message)
end

function Game:draw()
end

return Game
