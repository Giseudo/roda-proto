require "env"
require "lib.roda"
require "src.game"

function love.load()
	roda:initialize();
	game:initialize();
end

function love.update(dt)
	roda:update(dt)
end

function love.draw()
	roda:draw()
end

function love.quit()
end
