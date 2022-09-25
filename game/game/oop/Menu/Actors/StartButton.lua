require "FW.FW_Button"
---@class StartButton : ImageActor
StartButton = Button:extend()

function StartButton:new(screen,x,y,w,h,rot,img,text,tw,th,font,color)
    StartButton.super.new(self,screen,x,y,w,h,rot,img,text,tw,th,font,color)
end

function StartButton:onClick(istouch,presses)
    local screen = self:getScreen()
    local game = screen:getGame()
    require "Game.GameScreen"
    gs = GameScreen(game)
    game:AddScreen(gs)
    game:SetScreen(gs)
end