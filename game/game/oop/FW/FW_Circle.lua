---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Myloo.
--- DateTime: 2022. 09. 25. 20:21
---
require "FW.FW_Shape"
---@class Circle : Shape
Circle = Shape:extend()

function Circle:new(screen,mode,x,y,color,radius,segments)
    self.super.new(self,screen, mode, x, y)
    self.radius = radius
    self.segments = segments
    self.color = color or {1,1,1}
end

function Circle:render()
    love.graphics.setColor(self.color)
    love.graphics.circle(self.mode,self.x,self.radius,self.segments)
    love.graphics.setColor({1,1,1})
end