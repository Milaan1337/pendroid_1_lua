require "FW.FW_ImageActor"
Button = ImageActor:extend()

function Button:new(x,y,w,h,img)
    self.super.new(ImageActor,x,y,w,h,img)
end

--[[
    TODO
]]