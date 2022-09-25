require "FW.FW_Actor"
---@class ImageActor : Actor
---@field img string
---@field actor userdata
---@field original_w number
---@field original_h number
---@field w number
---@field h number
---@field pw number
---@field ph number
---@field
ImageActor = Actor:extend()
---Ez a funkció létrehoz egy ImageActor-t.
---@param x number
---@param y number
---@param w number
---@param h number
---@param rot number
---@param img string
function ImageActor:new(screen,x,y,w,h,rot,img)
    ImageActor.super.new(self,screen,x,y,w,h,rot)
    self.img = img
    self.actor = love.graphics.newImage(self.img)
    self.original_w,self.original_h = self.actor:getWidth(),self.actor:getHeight() 
    self.w = self.w / self.original_w
    self.h  = self.h / self.original_h
    self.pw, self.ph = w,h
end

function ImageActor:setSize(w,h)
    self.w,self.h = w/self.original_w,h/self.original_h
    self.pw, self.ph = w,h
end

function ImageActor:render()
    love.graphics.draw(self.actor,self.x,self.y,self.rotation,self.w,self.h)
end