require "FW.FW_Screen"
GameScreen = Screen:extend()

function GameScreen:new(game)
    self.super.new(self,game)
    local assets = {
    }
    for i,v in pairs(assets) do
        self.assetManager:Add(v.type,v.path,v.love2d)        
    end
    self.assetManager:LoadAssets(self)
end

function GameScreen:draw()
    for i,v in pairs(self.actors) do
        love.graphics.draw(v.actor,v.object.x,v.object.y,v.object.rotation,v.object.w,v.object.h)        
    end
end

function GameScreen:onStart()
    require "Menu.MenuStartButton"
    self.startbutton = StartButton(self,60,0,550,120,0,"assets/ball.jpg")
    self:addImageActor(self.startbutton)
end