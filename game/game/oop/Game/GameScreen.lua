require "FW.FW_Screen"
GameScreen = Screen:extend()
require "FW.FW_Rectangle"
Rectangle = Rectangle:extend()

function GameScreen:new(game)
    self.super.new(self,game)
    local assets = {
    }
    for i,v in pairs(assets) do
        self.assetManager:Add(v.type,v.path,v.love2d)        
    end
    self.assetManager:LoadAssets(self)
end

function GameScreen:draw()
    for i,v in pairs(self.actors) do
        love.graphics.draw(v.actor,v.object.x,v.object.y,v.object.rotation,v.object.w,v.object.h)        
    end
end
x = 0
y = 0
hp = 100

function GameScreen:update(dt)
    if love.keyboard.isDown("w") then
        y =  y - 10;
    end
    if love.keyboard.isDown("s") then
        y =  y + 10;
    end
    if love.keyboard.isDown("d") then
        x =  x + 10;
    end
    if love.keyboard.isDown("a") then
        x =  x - 10;
    end
    self.startbutton = StartButton(self,x,y,300,120,0,"assets/ball.jpg")
    self:addImageActor(self.startbutton)
    love.graphics.rectangle("line", x - 1, y - 20, 302, 10)
    love.graphics.setColor(255,0,0,255)
    love.graphics.rectangle("fill", x, y - 19, hp, 8)
    love.graphics.setColor(255,255,255)
end

function GameScreen:onStart()
    require "Menu.MenuStartButton"
    self.startbutton = StartButton(self,x,y,550,120,0,"assets/ball.jpg")
    self:addImageActor(self.startbutton)
end
