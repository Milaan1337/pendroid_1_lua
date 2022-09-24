require "FW.FW_Screen"
MenuScreen = Screen:extend()
function MenuScreen:new(game)
    self.super.new(self,game)
    local assets = {
        {
        love2d = "assets.ball.jpg",
        path = "assets/ball.jpg",
        type = self.assetManager.assetType.img,
        }
    }
    for i,v in pairs(assets) do
        self.assetManager:Add(v.type,v.love2d,v.path)
    end
    self.assetManager:LoadAssets(self)
end

function MenuScreen:draw()
    for i,v in pairs(self.actors) do
        love.graphics.draw(v.actor,v.object.x,v.object.y,v.object.rot,v.object.w,v.object.h)
    end
end