require "FW.FW_GameManager"
MainGame = GameManager:extend()

function MainGame:new()
    self.super.new(self)
end