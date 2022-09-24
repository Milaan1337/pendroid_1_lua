Screen = Object:extend()
---Ez a funkció létrehoz egy új Screen-t.
---@param game GameManager
function Screen:new(game)
    require "FW.FW_AssetManager"
    self.assetManager = AssetManager()
    self.assetsLoaded = false
    self.actors = {}
    self.screen = love.graphics.newCanvas()
    game:AddScreen(self,true)
end
---Ez a funkció visszaadja a Screen típust.
---@return Screen Screen
function Screen:getType()
    return self
end
---Ez a funkció minden képkockába lefut.
---@param dt delta_time
function Screen:update(dt)
    print("screen")
    for i,v in pairs(self.actors) do
        if (v.object.update ~= nil) then
            v.object:update(dt)
        end
    end
end
---Ez a funkció rajzolja ki a képernyőre a dolgokat.
function Screen:draw()
end
---Ez a funkció hozza létre az ImageActor-t
---@param x number
---@param y number
---@param w number
---@param h number
---@param rot number
---@param img number
---@return actor ImageActor
function Screen:addImageActor(x,y,w,h,rot,img)
    require "FW.FW_ImageActor"
    local actor = ImageActor(x,y,w,h,rot,img)
    table.insert(self.actors,{object = actor,actor = actor.actor,id = #self.actors})
    return actor
end