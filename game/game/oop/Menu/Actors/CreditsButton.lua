require "FW.FW_ImageActor"
CreditsButton = ImageActor:extend()

function CreditsButton:new(screen,x,y,w,h,rot,img)
    CreditsButton.super.new(self,screen,x,y,w,h,rot,img)
end
