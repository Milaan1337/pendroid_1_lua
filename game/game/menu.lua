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
            [4] = {
                name = "credits",
                img = love.graphics.newImage("files/credits.png"),
                x = 0,
                y = 0,
            },
        },
        background = {
            backgroundimg = love.graphics.newImage("files/back.jpg"),
        },
        musicObject = {
            sound = nil,
            images = {
                img_on = nil,
                img_off = nil,
                active_image = nil,
            },
            playing = nil,
            x = 0,
            y = 0,
        }
    }
}
---Menü draw funkciója - a main.lua(draw) funkciója átirányítja az éppen aktív képernyő screenjére, ugyanez igaz a többi esemény-kezelő funkcióra is.
function menu_draw()
    menu_table.window_w, menu_table.window_h = love.graphics.getDimensions()
    love.graphics.draw(menu_table.assets.background.backgroundimg, 0, 0, 0, menu_table.window_w / menu_table.assets.background.backgroundimg:getWidth(), menu_table.window_h / menu_table.assets.background.backgroundimg:getHeight())
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
    --#region Music object
    if type(menu_table.assets.musicObject.images.active_image) ~="nil" then
        love.graphics.draw(menu_table.assets.musicObject.images.active_image,menu_table.assets.musicObject.x,menu_table.assets.musicObject.y,0,0.2,0.2)
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
    --#region Music
    if type(menu_table.assets.musicObject.images.active_image) ~= "nil" then
        local w,h = menu_table.assets.musicObject.images.active_image:getDimensions()
        if isInBox(x,y,menu_table.assets.musicObject.x,menu_table.assets.musicObject.y,w,h) then
            menu_refreshMusicObject()
        end        
    end
    --#endregion
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
    elseif button == "credits" then
        main_setCanvas(main.screens.credits)
    elseif button == "play" then
        main_setCanvas(main.screens.game)
    end
end
---Ez a funkció frissíti a musicObjectet.
function menu_refreshMusicObject()
    if menu_table.assets.musicObject.images.active_image == nil then
        --#region first setup
        menu_table.assets.musicObject.images.img_on = love.graphics.newImage("files/music_on.png")
        menu_table.assets.musicObject.images.img_off = love.graphics.newImage("files/music_off.png")
        menu_table.assets.musicObject.images.active_image = menu_table.assets.musicObject.images.img_on 
        menu_table.assets.musicObject.playing = true
        menu_table.assets.musicObject.sound = love.audio.newSource("files/music.mp3","static")
        love.audio.play(menu_table.assets.musicObject.sound)
        menu_table.assets.musicObject.sound:setLooping(true)
        --#endregion
        --#region music positioning
        local w_w,w_h = love.graphics.getDimensions()
        menu_table.assets.musicObject.x,menu_table.assets.musicObject.y = w_w -  (menu_table.assets.musicObject.images.active_image:getWidth()*0.2),w_h - (menu_table.assets.musicObject.images.active_image:getHeight()*0.1)
        --#endregion
    else
        if menu_table.assets.musicObject.playing then
            --pause
            menu_table.assets.musicObject.images.active_image = menu_table.assets.musicObject.images.img_off
            menu_table.assets.musicObject.playing = false
            menu_table.assets.musicObject.sound:pause()
        else
            menu_table.assets.musicObject.images.active_image = menu_table.assets.musicObject.images.img_on 
            menu_table.assets.musicObject.playing = true
            menu_table.assets.musicObject.sound:play()
        end
    end
end