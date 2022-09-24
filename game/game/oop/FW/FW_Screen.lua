Screen = Object:extend()
function Screen:new(game)
    require "FW.FW_AssetManager"
    self.assetManager = AssetManager()
    self.assetsLoaded = false
    self.actors = {}
    self.screen = love.graphics.newCanvas()
    game:AddScreen(self,true)
end

function Screen:getType()
    return self
end

function Screen:update(dt)
end

function Screen:draw()
end

function Screen:addImageActor(x,y,w,h,rot,img)
    require "FW.FW_ImageActor"
    local actor = ImageActor(x,y,w,h,rot,img)
    table.insert(self.actors,{object = actor,actor = actor.actor,id = #self.actors})
    return actor
end