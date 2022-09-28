---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by tanulo.
--- DateTime: 2022. 09. 28. 15:25
---
---@class Camera : Object
---@param screen Screen
Camera = Object:extend(screen,x,y,w,h)
function Camera:new()
    require "FW.gamera"
    self.screen = screen
    self.x = x
    self.y = y
    self.w = w
    self.h = h
    self.scale = 1
    self.angle = 0
    self.cam = gamera.new(x,y,w,h)

end

function Camera:draw()
    self.cam:draw(self.screen.draw)
end