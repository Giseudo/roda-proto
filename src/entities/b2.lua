local Class = require (LIB_PATH .. "hump.class")
local Vector = require (LIB_PATH .. "hump.vector")
local GameObject = require (RODA_PATH .. "core.game-object")
local Character = require (RODA_PATH .. "components.character")
local Rigidbody = require (RODA_PATH .. "components.rigidbody")
local Sprite = require (RODA_PATH .. "components.sprite")
local Transform = require (RODA_PATH .. "components.transform")
local Device = require (RODA_PATH .. "components.device")
local Animator = require (RODA_PATH .. "components.animator")

local B2 = Class{
	__includes = GameObject
}

function B2:init(position)
	GameObject.init(self, "B2")

	self.transform = Transform(position)
	self.character = Character("Android Serie B2")
	self.sprite = Sprite("assets/images/B2.png", 32, 32, 0)
	self.rigidbody = Rigidbody(16, 32)
	self.device = Device
	self.animator = Animator("idle", 0, 6, 0.1)
	self.animator:add("run", 7, 14, 0.1)
end

return B2
