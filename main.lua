require "env"

local love = love
local Roda = require "lib.roda"
local Game = require "src.game"

local engine
local game

function love.load()
	engine = Roda()
	game = Game(engine.bus)
end

function love.update(dt)
	engine:update(dt)
	game:update(dt)
end

function love.draw()
end

function love.quit()
end
