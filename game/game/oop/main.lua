
function love.load()
    Object = require "FW.classic"
    require "MainGame"
    ---@type GameManager
    maingame = MainGame()
    require "Menu.MenuScreen"
    ---@type Screen
    menuscreen = MenuScreen(maingame)

        
end

function love.draw()
    if maingame.currentScreen ~= nil then
        if (maingame.currentScreen.draw ~= nil and maingame.currentScreen.assetsLoaded) then
            love.graphics.setCanvas(maingame.currentScreen.screen)
            love.graphics.clear()
            maingame.currentScreen:draw()
            love.graphics.setCanvas()
            love.graphics.draw(maingame.currentScreen.screen)
        end
    end
end
---
function love.update(dt)
    maingame:update(dt)
end

function love.mousepressed(x,y,btn,istouch,presses)
    if (maingame.currentScreen.mousepressed ~= nil) then
        maingame.currentScreen:mousepressed(x,y,btn,istouch,presses)
    end
end