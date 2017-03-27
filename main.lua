require "env"
local engine = require "lib.roda"
local Game = require "src.game"

Roda = engine()

function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest", 0)
	local game = Game()
end

function love.update(dt)
	Roda:update(dt)
end

function love.draw()
	Roda:draw()
end

function love.quit()
end
