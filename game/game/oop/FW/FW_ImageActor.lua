require "FW.FW_Actor"
ImageActor = Actor:extend()

function ImageActor:new(x,y,w,h,rot,img)
    self.super.new(self,x,y,w,h,rot)
    self.actor = love.graphics.newImage(img)
    self.w,self.h = self.w / self.actor:getWidth(),self.h / self.actor:getHeight()
end