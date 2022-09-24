require "FW.FW_Screen"
MenuScreen = Screen:extend()

function MenuScreen:new(game)
    self.super.new(self,game)
    local assets = {
        path = "assets/ball.jpg",
        love2d = "assets.ball.jpg",
        type = self.assetManager.assetType.img,
    }
    for i,v in pairs(assets) do
        self.assetManager:Add(v.type,v.path,v.love2d)        
    end
    self.assetManager:LoadAssets(self)
end

function MenuScreen:draw()
    for i,v in pairs(self.actors) do
        love.graphics.draw(v.actor,v.object.x,v.object.y,v.object.rotation,v.object.w,v.object.h)        
    end
end

function MenuScreen:onStart()
    require "Menu.MenuStartButton"
    self.startbutton = StartButton(self,0,0,150,120,0,"assets/ball.jpg")
    self:addImageActor(self.startbutton)
end