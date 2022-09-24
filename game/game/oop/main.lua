function love.load()
    Object = require "FW.classic"
    require "game"
    maingame = game()
    require "MenuScreen"
    menuScreen = MenuScreen(maingame)
    menuScreen.assetManager:Add(menuScreen.assetManager.assetType.img,"assets.ball.jpg","assets/ball.jpg")
    menuScreen.assetManager:LoadAssets(menuScreen)
    labda = menuScreen:addImageActor(0,0,100,100,0,"assets/ball.jpg")
    labda = menuScreen:addImageActor(105,0,100,100,0,"assets/ball.jpg")
    labda = menuScreen:addImageActor(210,0,100,100,0,"assets/ball.jpg")
end

function love.draw()
    if (maingame.currentScreen.draw ~= nil and maingame.currentScreen.assetsLoaded) then
        love.graphics.setCanvas(maingame.currentScreen.screen)
        love.graphics.clear()
        maingame.currentScreen:draw()
        love.graphics.setCanvas()
        love.graphics.draw(maingame.currentScreen.screen)
    end
end

function love.update(dt)
    maingame:update(dt)
end