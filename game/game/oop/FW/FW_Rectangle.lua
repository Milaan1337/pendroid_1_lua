require "FW.FW_Actor"
Rectangle = Actor:extend()

function Rectangle:new(mode,x,y,w,h,rx,ry,segment)
    self.super.new(self,x,y,w,h,rx)
    self.actor = love.graphics.rectangle(mode,x,y,w,h,rx,ry,segment)
end

function Rectangle:getType()
    return self
end