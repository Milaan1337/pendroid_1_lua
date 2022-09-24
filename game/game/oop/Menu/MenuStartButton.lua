require "FW.FW_ImageActor"
StartButton = ImageActor:extend()

function StartButton:new(screen,x,y,w,h,rot,img)
    self.super.new(ImageActor,screen,x,y,w,h,rot,img)
end

function StartButton:onClick()
    local screen = self:getScreen()
    local game = screen:getGame()
    require "Game.GameScreen"
    print("katt")
    gameScreen = GameScreen(game,false)
    game:SetScreen(gameScreen,true)
end