require "FW.FW_Button"
BeatButton = Button:extend()

function BeatButton:new(screen,x,y,w,h,rot,img,text,tw,th,font,color)
    BeatButton.super.new(self,screen,x,y,w,h,rot,img,text,tw,th,font,color)
end
