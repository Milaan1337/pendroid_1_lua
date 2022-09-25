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
    self.startbutton = StartButton(self,0,0,150,120,0,"assets/ball.jpg","Start")
    self:addImageActor(self.startbutton)
    --Buttons--
    require "FW.FW_Button"
end