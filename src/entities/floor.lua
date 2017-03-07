local Class = require (LIB_PATH .. "hump.class")
local GameObject = require (RODA_PATH .. "core.game-object")
local Rigidbody = require (RODA_PATH .. "components.rigidbody")
local Transform = require (RODA_PATH .. "components.transform")

local Floor = Class{
	__includes = GameObject
}

function Floor:init(position, width, height)
	GameObject.init(self, "Floor")

	self.transform = Transform(position)
	self.rigidbody = Rigidbody(width, height)
	self.rigidbody.kinematic = true
end

return Floor
