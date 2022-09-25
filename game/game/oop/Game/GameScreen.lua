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

function GameScreen:update(dt)
    if love.keyboard.isDown("w") then
        self.character.y =  self.character.y - 10;
    end
    if love.keyboard.isDown("s") then
        self.character.y =  self.character.y + 10;
    end
    if love.keyboard.isDown("d") then
        self.character.x =  self.character.x + 10;
    end
    if love.keyboard.isDown("a") then
        self.character.x =  self.character.x - 10;
    end
    self.enemyactor.x = self.enemyactor.x + ((self.character.x - self.enemyactor.x) * x)
    self.enemyactor.y = self.enemyactor.y + ((self.character.y - self.enemyactor.y) * x)

end

function GameScreen:onStart()
    require "Menu.MenuStartButton"
    require "Game.Actors.EnemyActor"
    self.character = StartButton(self,0, 0, 75,100, 0,"assets/character.png")
    self:addImageActor(self.character)
    self.enemyactor = EnemyActor(self,0,0,75,100,0,"assets/enemy.png")
    self:addImageActor(self.enemyactor)
    x = 0.01
end
