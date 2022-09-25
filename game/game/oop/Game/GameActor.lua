require "FW.FW_ImageActor"
GameActor = ImageActor:extend()

function GameActor:new(screen,x,y,w,h,rot,img)
    GameActor.super.new(self,screen,x,y,w,h,rot,img)
end
