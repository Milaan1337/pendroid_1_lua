---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Myloo.
--- DateTime: 2022. 09. 25. 20:17
---
require "FW.FW_Shape"
---@class Rectangle : Shape
Rectangle = Shape:extend()

function Rectangle:new(screen, mode, x, y, w, h,color, rx, ry, segments)
    Rectangle.super.new(self,screen, mode, x, y, w, h,color, rx, ry, segments)
end


function Rectangle:render()
    love.graphics.setColor(self.color)
    love.graphics.rectangle(self.mode,self.x,self.y,self.w,self.h,self.rx,self.ry,self.segments)
    love.graphics.setColor({1,1,1})
end