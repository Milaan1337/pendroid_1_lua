require "FW.FW_Screen"
---@class CreditsScreen : Screen
CreditsScreen = Screen:extend()

function CreditsScreen
:new(game)
    self.super.new(self,game)
    local assets = {
        path = "assets/ball.jpg",
        love2d = "assets.ball.jpg",
        type = self.assetManager.assetType.img,
    }
    for i,v in pairs(assets) do
        self.assetManager:Add(v)        
    end
    self.assetManager:LoadAssets(self)
end

function CreditsScreen:draw()
    for i,v in pairs(self.actors) do
        v.object:render()       
    end
end

function CreditsScreen:onStart()
    require "Credits.CreditActors.BackButton"
    w, h = love.graphics.getDimensions()
    self.backbutton = BackButton(self, w / 2 - 75,h / 2 - 150, 150, 50, 0, "assets/backbutton.png","")
    self:addImageActor(self.backbutton)
end