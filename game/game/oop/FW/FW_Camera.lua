---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by tanulo.
--- DateTime: 2022. 09. 28. 15:25
---
---@class Camera : Object
---@param screen Screen
Camera = Object:extend()
---@param screen Screen
---@param x number
---@param y number
---@param actor Actor
---@param zoom number
---@param smooth boolean
function Camera:new(screen,x,y,actor,zoom,rot,smooth)
    local cam = require("FW.camera")
    self.screen = screen
    if actor then
        self.rot = rot
        self.lx = actor.x
        self.ly = actor.y
        self.zoom = zoom
        self.smooth = smooth
    else
        self.rot = rot
        self.lx = x
        self.ly = y
        self.zoom = zoom
        self.smooth = smooth

    end
    self.cam = cam.new(self.lx,self.ly,self.zoom,self.rot,self.smooth)

end

function Camera:draw()
    self.cam:attach()
    self.screen:draw()
    self.cam:detach()
end

function Camera:lookAt(x,y)
    self.cam:lookAt(x,y)
    
end

function Camera:move(x,y)
    self.cam:move(x,y)
end

function Camera:getPosition()
    return self.cam:position()
end

---@param angle number radián
function Camera:rotate(angle)
    self.cam:rotate(angle)
end

function Camera:setRotation(angle)
    self.cam:rotateto(angle)
end

function Camera:Zoom(zoom)
    self.cam:zoom(zoom)
end

function Camera:setZoom(zoom)
    self.cam:zoomTo(zoom)
end