require "FW.FW_ImageActor"
---@class BackgroundActor : ImageActor
BackgroundActor = ImageActor:extend()

function BackgroundActor:new(screen,x,y,w,h,rot,img)
    BackgroundActor.super.new(self,screen,x,y,w,h,rot,img)
end
