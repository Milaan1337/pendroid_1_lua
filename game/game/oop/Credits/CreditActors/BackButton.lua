require "FW.FW_Button"
---@class BackButton : Button
BackButton = Button:extend()

function BackButton:new(screen,x,y,w,h,rot,img,text,tw,th,font,color)
    BackButton.super.new(self,screen,x,y,w,h,rot,img,text,tw,th,font,color)
end
