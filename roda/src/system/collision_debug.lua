local Tiny = require 'tiny'

local collision_debug = {}
collision_debug.__index = collision_debug

function collision_debug:new()
	local o = setmetatable({
		filter = Tiny.requireAll('collider', 'transform'),
		isDebugSystem = true
	}, collision_debug)

	return Tiny.processingSystem(o)
end

function collision_debug:process(e, dt)
	-- Update shape position
	e.collider.shape.position = e.transform.position
	love.graphics.setColor(0, 255, 0, 150)
	e.collider.shape:draw('line')
end

return setmetatable(collision_debug, {
	__call = collision_debug.new
})
