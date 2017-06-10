local Transform = require (RODA_SRC .. 'component.transform')
local Body = require (RODA_SRC .. 'component.body')
local Collider = require (RODA_SRC .. 'component.collider')
local Sprite = require (RODA_SRC .. 'component.sprite')
local Animator = require (RODA_SRC .. 'component.animator')
local Controller = require (RODA_SRC .. 'component.controller')

local dummy = {}
dummy.__index = dummy

function dummy:new(position, size)
	local o = {}

	o.transform = Transform(position)
	o.body = Body(Vector(0, 0), Vector(0, 0), Vector(-0.15, 0.0))
	o.collider = Collider(Rect(position, size))
	o.controller = Controller(0.3)
	o.sprite = Sprite('b2', 'assets/images/B2.png', 32, 32, 0, 4)
	o.animator = Animator('Idle', 7, 11)

	return setmetatable(o, dummy)
end

return setmetatable(dummy, { __call = dummy.new })
