require "env"

local love = love
local Roda = require "lib.roda"
local Game = require "src.game"

local engine
local game

function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest", 0)

	engine = Roda()
	game = Game(engine)
end

function love.update(dt)
	engine:update(dt)
end

function love.draw()
	engine:draw()
end

function love.quit()
end
