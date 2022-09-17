--[[
    Menu screen
    Minden képernyőnek új fájlt és saját táblát hozunk létre.
]]
--[[
    Menü táblája - itt kezeljük a screen assets-eit, objectjeit ha van az átláthatóság miatt.
]]
menu_table = {
    assets = {
        images = {
            [1] = {
                name = "play",
                img = love.graphics.newImage("files/play.png"),
                x = 0,
                y = 0,
            },
            [2] = {
                name = "settings",
                img = love.graphics.newImage("files/settings.png"),
                x = 0,
                y = 0,
            },
            [3] = {
                name = "exit",
                img = love.graphics.newImage("files/exit.png"),
                x = 0,
                y = 0,
            },
        }
    }
}
---Menü draw funkciója - a main.lua(draw) funkciója átirányítja az éppen aktív képernyő screenjére, ugyanez igaz a többi esemény-kezelő funkcióra is.
function menu_draw()
    --#region Menü gombok
    local y_index = 0
    for i,v in pairs(menu_table.assets.images) do
        local w,h = v.img:getDimensions()
        local window_w,window_h = love.graphics.getDimensions()
        love.graphics.draw(v.img,window_w/2 - w/2,window_h/2 - (#menu_table.assets.images/2)*h + y_index)
        v.x = window_w/2 - w/2
        v.y = window_h/2 - (#menu_table.assets.images/2)*h + y_index
        y_index = y_index + h + 15
    end
    --#endregion
end

function menu_click(x,y,button)
    --menü gombok
    for i,v in ipairs(menu_table.assets.images) do
        local w,h = v.img:getDimensions()
        if isInBox(x,y,v.x,v.y,w,h) then
            menu_buttons_click(v.name)
        end
    end
    --
end


---Ez a funkció a megadott adatok alapján kiszámolja belekattintottunk-e a bizonyos boxba.
---@param cx cursor_x egér x
---@param cy cursor_y egér y
---@param x box_x box x
---@param y box_y box y
---@param w box_w box szélessége
---@param h box_h box magassága
---@return bool isinbox benne van-e
function isInBox(cx,cy,x,y,w,h)
    if cx >= x and cx<=x+w then
        if cy>=y and cy<= y+h then
            return true
        end 
    end
    return false
end
--- Ez a funkció kezeli a menü gombok kattintás eseményeit.
---@param button menu_button gomb azonosítója
function menu_buttons_click(button)
    if button == "exit" then
        love.event.quit()
    elseif button == "settings" then
        main_setCanvas(main.screens.settings)
    end
end