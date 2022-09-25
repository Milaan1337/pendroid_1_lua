---@class Screen
---@field game GameManager
---@field assetManager AssetManager
---@field assetsLoaded boolean
---@field actors table
---@field screen Screen
Screen = Object:extend()
---Ez a funkció létrehoz egy új Screen-t.
---@param game GameManager
function Screen:new(game)
    require "FW.FW_AssetManager"
    self.game = game
    self.assetManager = AssetManager()
    self.assetsLoaded = false
    self.actors = {}
    self.screen = love.graphics.newCanvas()
    game:AddScreen(self)
end
---Ez a funkció visszaadja a Screen típust.
---@return Screen Screen
function Screen:getType()
    return self
end

function Screen:getGame()
    return self.game
end
---Ez a funkció minden képkockába lefut.
---@param dt delta_time
function Screen:update(dt)
    for i,v in pairs(self.actors) do
        if (v.object.update ~= nil) then
            v.object:update(dt)
        end
    end
end
---Ez a funkció rajzolja ki a képernyőre a dolgokat.
function Screen:draw()
end
function Screen:mousepressed(x,y,btn,istouch,presses)
    for i,v in pairs(self.actors) do
        if isInBox(x,y,v.object.x,v.object.y,v.object.pw,v.object.ph) then
            if (v.object.onClick ~= nil) then
                v.object:onClick(istouch,presses)
            end
        end
    end
end
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
---Ez a funkció hozza létre az ImageActor-t
---@param x number
---@param y number
---@param w number
---@param h number
---@param rot number
---@param img number
function Screen:addImageActor(actor)
    require "FW.FW_ImageActor"
    table.insert(self.actors,{object = actor,actor = actor.actor,id = #self.actors, type ="image"})
end

function Screen:onStart()

end