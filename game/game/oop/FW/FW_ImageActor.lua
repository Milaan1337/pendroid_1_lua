require "FW.FW_Actor"
ImageActor = Actor:extend()
---Ez a funkció létrehoz egy ImageActor-t.
---@param x number
---@param y number
---@param w number
---@param h number
---@param rot number
---@param img string
function ImageActor:new(x,y,w,h,rot,img)
    self.super.new(self,x,y,w,h,rot)
    self.actor = love.graphics.newImage(img)
    self.original_w,self.original_h = self.actor:getWidth(),self.actor:getHeight() 
    self.w,self.h = self.w / self.original_w ,self.h / self.original_h
    self.pw, self.ph = w,h
end

function ImageActor:setSize(w,h)
    self.w,self.h = w/self.original_w,h/self.original_h
end