require "env"
require "lib.roda"
require "src.game"

function love.load()
	Roda:run()
	Game:initialize()
end

function love.update(dt)
	Roda:update(dt)
	Game:update(dt)
end

function love.draw()
	Roda:draw()
	Game:draw()
end

function love.quit()
end
