require "FW.FW_Button"
---@class CreditBackground : Button
CreditBackground = Button:extend()

function CreditBackground:new(screen,x,y,w,h,rot,img,text,tw,th,font,color)
    CreditBackground.super.new(self,screen,x,y,w,h,rot,img,text,tw,th,font,color)
end