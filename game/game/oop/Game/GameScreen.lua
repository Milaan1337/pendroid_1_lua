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

function GameScreen:update(dt, key)
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

        --ez egyszeruen a hitboxhoz kell, hogy minden lehetoseget kiprbbaljunk
        x1 = self.character.x
        x2 = self.enemyactor.x
        y1 = self.character.y
        y2 = self.enemyactor.y
        w1 = self.character.pw
        h1 = self.character.ph
        h2 = self.enemyactor.ph
        ew = self.enemyactor.pw
        
        --utkozes kezeles, minden lehetoseg figyelembe veve
        if (x1 < x2+ew and x2 < x1+w1 and y1 < y2+h2 and y2 < y1+h1) then
            if (self.character.hp >= 1) then
                self.character.hp = self.character.hp - 1;
                print(self.character.hp)
            end
        end
    --ezt kell megoldani
    --[[
    --itt fut le az, hogy lassuk a hitboxokat
    love.graphics.rectangle("line", self.character.x, self.character.x, charw, charh)
    love.graphics.rectangle("line", self.enemyactor.x, self.enemyactor.y, enew, eneh)
    --hp bar
    love.graphics.rectangle("line", self.character.x - 1, self.character.x - 20, self.character.character:getWidth() + 2, 10)
    love.graphics.setColor(255,0,0,255)
    love.graphics.rectangle("fill", self.character.x, self.character.x - 19, self.character.hp, 8)
    love.graphics.setColor(255,255,255)
    ]]--
end



function GameScreen:onStart()
    require "Game.GameActor"
    require "Game.Actors.EnemyActor"
    self.enemyactor = EnemyActor(self,0,0,75,100,0,"assets/enemy.png")
    self:addImageActor(self.enemyactor)
    self.character = GameActor(self,0, 0, 75,100, 0,"assets/character.png")
    self:addImageActor(self.character)
end
