Game = {}

function Game:initialize()
	Roda.resources:load_shader('default', 'default/vertex.glsl', 'default/fragment.glsl')
	Roda.resources:load_shader('blink', 'default/vertex.glsl', 'blink/fragment.glsl')
end

function Game:update(dt)
end

function Game:draw()
end
