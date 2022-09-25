require "FW.FW_Screen"
---@class GameScreen : Screen
GameScreen = Screen:extend()

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
    self.assetManager:LoadAssets(self)
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
    if (self.character:isCollidedWith(self.enemyactor)) then
        if (self.character.hp > 0) then
            self.character.hp = self.character.hp - 1
            print(self.character.hp)
        end
    end
        
        --utkozes kezeles, minden lehetoseg figyelembe veve

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
    w, h = love.graphics.getDimensions()
    require "Game.GameActor"
    require "Game.Actors.EnemyActor"
    require "Game.Actors.BeatButton"
    require "FW.FW_Rectangle"
    require "FW.FW_Circle"
    self.enemyactor = EnemyActor(self,0,0,75,100,0,"assets/enemy.png")
    self:addActor(self.enemyactor,"img")
    self.character = GameActor(self,0, 0, 75,100, 0,"assets/character.png")
    self:addActor(self.character,"img")
    self.beatbutton = BeatButton(self, w - 200, h - 200, 50,50, 0, "assets/ball.jpg", "")
    self:addActor(self.beatbutton,"img")
    --SHAPEK--
    ---@type Shape
    love.graphics.setColor(255,0,0,255)
    self.rectangle = Rectangle(self,"line",self.character.x - 1,self.character.y - 20,self.character.pw + 2,10,0,0,5)
    self:addActor(self.rectangle,"shape")
    self.rectangle2 = Rectangle(self,"fill",self.character.x,self.character.y -19,self.character.hp,8,0,0,50)
    self:addActor(self.rectangle2,"shape")
    love.graphics.setColor(255,255,255)

    self.c = Circle(self,"fill",350,0,50,50)
    self:addActor(self.c,"shape")
    --még ez csak probaslkozas pls nem torolni
    --[[ 
    self.beatbutton.onClick = function()
    end
    if (self.enemyactor.x > self.character.x - (self.enemyactor + 50))then
        self.enemyactor.hp = self.enemyactor.hp - 10;
        print( self.enemyactor.hp)
    end]]--
end

