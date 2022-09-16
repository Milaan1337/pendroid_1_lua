require "menu"
require "settings"
function love.load()
    main = {
        currentScreen = {
          screen = nil,
          canvas = nil,
          name = nil,  
        },
        screens = {
            menu = {
                canvas = love.graphics.newCanvas(),
                name = "Főmenü",
                draw = menu_draw,
                click = menu_click,
            },
            settings = {
                canvas = love.graphics.newCanvas(),
                name = "Beállítások",
                draw = settings_draw,
                click = menu_click,
            }
        }
    }
    --
    main_setCanvas(main.screens.menu)
end

function main_setCanvas(screen)
    if main.currentScreen.canvas ~= nil then
        love.graphics.clear()
    end
    main.currentScreen.screen = screen
    main.currentScreen.canvas = screen.canvas
    main.currentScreen.name = screen.name
    love.window.setTitle(main.currentScreen.name)
end

function love.draw()
    --HA VAN CANVAS
    if main.currentScreen.screen ~= nil then
        love.graphics.setCanvas(main.currentScreen.canvas)
        main.currentScreen.screen.draw()
        love.graphics.setCanvas()
        love.graphics.draw(main.currentScreen.canvas)
    end
end

function love.mousepressed(mx, my, button)
    if button == 1 then
        if main.currentScreen.screen ~= nil and main.currentScreen.screen.click ~= nil then
            main.currentScreen.screen.click(mx,my,button)
        end
    end
end