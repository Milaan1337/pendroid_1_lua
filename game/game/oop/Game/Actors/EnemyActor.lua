require "FW.FW_ImageActor"
EnemyActor = ImageActor:extend()

function EnemyActor:new(screen,x,y,w,h,rot,img)
    self.super.new(ImageActor,screen,x,y,w,h,rot,img)
end
