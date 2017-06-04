love.graphics.setDefaultFilter('nearest', 'nearest', 1)

require "env"
require "roda"
require "src.game"

function love.load()
	Roda:run()
	Game:run()
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
