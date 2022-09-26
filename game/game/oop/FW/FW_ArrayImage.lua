---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Myloo.
--- DateTime: 2022. 09. 26. 17:48
---
---@class ArrayImage : Actor
ArrayImage = Actor:extend()

function ArrayImage:new(screen, x, y, w, h, images ,rot)
    Actor.super.new(self,screen, x, y, w, h, rot)
    self.images = images
    ---@type ImageActor
    self.imageActors = {}
    require "FW.FW_ImageActor"
    for i,v in pairs(self.images) do
        local actor = ImageActor(screen,x,y,w,h,rot,v)
        table.insert(self.imageActors,actor)
    end
end

function ArrayImage:render()
    for i,v in pairs(self.imageActors) do
        v:render()
    end
end