require "FW.FW_ImageActor"
ExitButton = ImageActor:extend()

function ExitButton:new(screen,x,y,w,h,rot,img)
    ExitButton.super.new(self,screen,x,y,w,h,rot,img)
end
