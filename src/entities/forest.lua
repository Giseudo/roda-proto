local Class = require (LIB_PATH .. "hump.class")
local Camera = require (LIB_PATH .. "hump.camera")
local Transform = require (RODA_PATH .. "components.transform")
local GameObject = require (RODA_PATH .. "core.game-object")

local Forest = Class{
	__includes = GameObject
}

function Forest:init(position)
	GameObject.init(self)

	self.camera = Camera(position.x, position.y, 2)
	self.transform = Transform(position)
	self.name = "forest"
end

return Forest
