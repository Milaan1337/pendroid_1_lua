require "FW.FW_Screen"
MenuScreen = Screen:extend()
function MenuScreen:new(game)
    self.super.new(self,game)
end

function MenuScreen:draw()
    for i,v in pairs(self.actors) do
        love.graphics.draw(v.actor,v.object.x,v.object.y,v.object.rot,v.object.w,v.object.h)
    end
end