--[[
Ez a main indítója. Ez fut le.
]]

require "menu" -- Ezzel importáljuk be más fájlok tartalmát, így tudunk fájlok közötti struktúrát használni
require "settings" -- Ezzel importáljuk be más fájlok tartalmát, így tudunk fájlok közötti struktúrát használni
require "credits"
require "debug"
---Ez a funkció fut le először(static void)
function love.load()
    --#region Main tábla felépítése
    main = {
        --A jelenlegi képernyőt elmentjük a táblába
        currentScreen = {
          screen = nil,
          canvas = nil,
          name = nil,  
        },
        -- Az előző képernyőt elmentjük a táblába
        previousScreen = {
            screen = nil,
            canvas = nil,
            name = nil,
        },
        -- A képernyőket táblába tároljuk a funkciójukkal is, ezáltal lelehet bontani az eseményeket screenekre.
        screens = {
            menu = {
                canvas = love.graphics.newCanvas(), -- új canvas létrehozása(screen)
                name = "Főmenü", -- title név(androidon nem kell)
                draw = menu_draw, -- rajz funkció
                click = menu_click, -- click funkció
                update = nil,
                --lehet bővíteni az események szerint
            },
            settings = {
                canvas = love.graphics.newCanvas(),
                name = "Beállítások",
                draw = settings_draw,
                click = nil,
                update = nil,
            },
            credits = {
                canvas = love.graphics.newCanvas(),
                name = "Készítők",
                draw = credits_draw,
                click = credits_click,
                update = nil,
            }
        }
    }
    --
    --love.window.setFullscreen(true,"desktop") 
    main_setCanvas(main.screens.menu)
end
---Ez a funkció kezeli a képernyőváltásokat
---@param screen screen
function main_setCanvas(screen)
    if main.currentScreen.canvas ~= nil then
        love.graphics.clear()
        main.previousScreen.screen = main.currentScreen.screen
        main.previousScreen.canvas = main.currentScreen.canvas
        main.previousScreen.name = main.currentScreen.name
    else
        main.previousScreen.screen = nil
        main.previousScreen.canvas = nil
        main.previousScreen.name = nil
    end
    main.currentScreen.screen = screen
    main.currentScreen.canvas = screen.canvas
    main.currentScreen.name = screen.name
    love.window.setTitle(main.currentScreen.name)
end
---Ez a funkció kezeli a visszanyíllal és/vagy escape-el történő képernyőváltást.
function main_setPreviousCanvas()
    if main.previousScreen.screen ~= nil then
        main.currentScreen.screen = main.previousScreen.screen
        main.currentScreen.canvas = main.previousScreen.canvas
        main.currentScreen.name = main.previousScreen.name
        love.window.setTitle(main.currentScreen.name) 
    else
        love.event.quit()
    end
end
---Ez a funkció rajzolja ki minden képkockába a képernyőre a dolgokat.
function love.draw()
    --HA VAN CANVAS
    if main.currentScreen.screen ~= nil then
        love.graphics.setCanvas(main.currentScreen.canvas)
        main.currentScreen.screen.draw()
        love.graphics.setCanvas()
        love.graphics.draw(main.currentScreen.canvas)
    end
end
---Ez a funkció minden képkockába lefut, azonban rajzolni itt nem lehet. Hasznos értékek állítására
---@param dt delta_time delta idő a program futása óta
function love.update(dt)
    if main.currentScreen.screen ~= nil and main.currentScreen.screen.update ~= nil then
        main.currentScreen.screen.update(dt)
    end
end
---Ez a funkció kezeli az egér és érintőképernyős eseményeket.
---@param mx mouse_x
---@param my mouse_y
---@param button mouse_button 1|2|3
function love.mousepressed(mx, my, button)
    if button == 1 then
        if main.currentScreen.screen ~= nil and main.currentScreen.screen.click ~= nil then
            main.currentScreen.screen.click(mx,my,button)
        end
    end
end
---Ez a funkció kezeli a billentyűütéseket.Ide tartozik a mobilos visszanyíl, home gomb, stb...
---@param key key key_names(wiki)
---@param scancode scancode ez nem gomb-ra vonatkozik hanem a gomb poziciojara igy pl más billentyuzet kiosztason is ott lesz
---@param isrepeat bool nyomások száma
function love.keypressed( key, scancode, isrepeat )
    if key ~= "escape" and key ~= "appback" then
        print("ok")
    else
        main_setPreviousCanvas()
    end
 end
