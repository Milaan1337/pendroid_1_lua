require "FW.FW_GameManager"
game = GameManager:extend()

function game:new()
    self.super.new(self)
end