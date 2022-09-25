require "FW.FW_ImageActor"
CreditsButton = ImageActor:extend()

function CreditsButton:new(screen,x,y,w,h,rot,img)
    CreditsButton.super.new(self,screen,x,y,w,h,rot,img)
end

function CreditsButton:onClick(istouch,presses)
    local screen = self:getScreen()
    local game = screen:getGame()
    require "Credits.CreditsScreen"
    gs = CreditsScreen(game)
    game:AddScreen(gs)
    game:SetScreen(gs)
end