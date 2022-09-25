require "FW.FW_Screen"
---@class MenuScreen : Screen
MenuScreen = Screen:extend()

function MenuScreen:new(game)
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

function MenuScreen:draw()
    for i,v in pairs(self.actors) do
        v.object:render()       
    end
end

function MenuScreen:onStart()
    require "Menu.Actors.StartButton"
    require "Menu.Actors.CreditsButton"
    require "Menu.Actors.ExitButton"
    w, h = love.graphics.getDimensions()
    self.startbutton = StartButton(self, w / 2 - 75,h / 2 - 150, 150, 50, 0, "assets/play.png","")
    self:addImageActor(self.startbutton)
    self.creditsbutton = CreditsButton(self, w / 2 - 75,h / 2 - 25, 150, 50, 0, "assets/credits.png","")
    self:addImageActor(self.creditsbutton)
    self.exitbutton = ExitButton(self, w / 2 - 75,h / 2 + 50, 150, 50, 0, "assets/exit.png","")
    self:addImageActor(self.exitbutton)
    self.exitbutton.onClick = function()
        love.event.quit()
    end
    --Buttons--
    require "FW.FW_Button"
end