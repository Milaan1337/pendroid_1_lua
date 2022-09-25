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
    require "Credits.CreditActors.CreditBackground"
    w, h = love.graphics.getDimensions()
    self.creditbackground = CreditBackground(self, 0, 0, w, h, 0, "assets/grass.png","")
    self:addActor(self.creditbackground,"img")
    self.backbutton = BackButton(self, 0, 0, 150, 50, 0, "assets/backbutton.png","")
    self:addActor(self.backbutton,"img")
end