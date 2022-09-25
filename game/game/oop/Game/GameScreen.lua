require "FW.FW_Screen"
GameScreen = Screen:extend()
require "FW.FW_Rectangle"
Rectangle = Rectangle:extend()

function GameScreen:new(game)
    self.super.new(self,game)
    local assets = {
        {
            love2d = 'assets.character.png',
            path = "assets/character.png",
            type = self.assetManager.assetType.img
        },
        {
            love2d = "assets.enemy.png",
            path = "assets/enemy.png",
            type = self.assetManager.assetType.img
        }
    }
    for i,v in pairs(assets) do
        self.assetManager:Add(v)        
    end
    c1 = os.clock()
    self.assetManager:LoadAssets(self)
    c2 = os.clock()
    print("Időkülönbség:" .. c2-c1)
end

function GameScreen:draw()
    for i,v in pairs(self.actors) do
        v.object:render()
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
    self.enemyactor:follow(self.character,0.01)

end

function GameScreen:onStart()
    require "Game.GameActor"
    require "Game.Actors.EnemyActor"
    self.enemyactor = EnemyActor(self,0,0,75,100,0,"assets/enemy.png")
    self:addImageActor(self.enemyactor)
    self.character = GameActor(self,0, 0, 75,100, 0,"assets/character.png")
    self:addImageActor(self.character)
end
