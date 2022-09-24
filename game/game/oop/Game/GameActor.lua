require "FW.FW_ImageActor"
GameActor = ImageActor:extend()

function GameActor:new(screen,x,y,w,h,rot,img)
    self.super.new(ImageActor,screen,x,y,w,h,rot,img)
end