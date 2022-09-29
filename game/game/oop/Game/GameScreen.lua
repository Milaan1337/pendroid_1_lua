require "FW.FW_Screen"
---@class GameScreen : Screen
GameScreen = Screen:extend()

function GameScreen:new(game)
    GameScreen.super.new(self,game)
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
    --beaalitasokban lehet majd alitani az fps szamlalot,local result = love.timer.getFPS( ),info a telefonrol: print(love.system.getPowerInfo())
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

    self.hpbar.x = self.character.x - 1
    self.hpbar.y = self.character.y - 20
    self.hp.x = self.character.x
    self.hp.y = self.character.y - 19
    self.hp.w = self.character.hp

    if(self:inOnScreen(self.enemyactor))then
        self.enemyactor:follow(self.character,0.01)
        if (self.character:isCollidedWith(self.enemyactor)) then
            if (self.character.hp > 0) then
                self.character.hp = self.character.hp - 1
                print(self.character.hp)
            end
        end
    end
    if (self.enemyactor.hp == 0)then
        self:removeActor(self.enemyactor)
    end

    time = love.timer.getTime()
    result = love.timer.getTime() - time
    print(result * 1000)
    if (self.beatradius ~= nil) then
        if (self.beatradius:isCollidedWith(self.enemyactor)) then
            if (self.enemyactor.hp >= 0 and utkozott == false)then
                self.enemyactor.hp = self.enemyactor.hp - 30
                utkozott = true
                self:removeActor(self.beatradius)
                utkozott = false
                self.beatradius = nil
                print(self.enemyactor.hp)
            end
        end
    end

end

function GameScreen:onStart()
    w, h = love.graphics.getDimensions()
    require "Game.GameActor"
    require "Game.Actors.EnemyActor"
    require "Game.Actors.BeatButton"
    require "Game.Actors.BackgroundActor"
    require "FW.FW_Rectangle"
    require "FW.FW_Circle"
    require "FW.FW_Text"
    require "FW.FW_Font"
    require "FW.FW_ArrayImage"
    utkozott = false
    self.backgroundactor = BackgroundActor(self, 0, 0, w, h, 0, "assets/grass.png")
    self:addActor(self.backgroundactor, "img")
    self.enemyactor = EnemyActor(self,0,0,75,100,0,"assets/enemy.png")
    self:addActor(self.enemyactor,"img")
    self.character = GameActor(self,0, 0, 100,100, 0,"assets/character.png")
    self:addActor(self.character,"img")
    self.beatbutton = BeatButton(self, w - 200, h - 200, 50,50, 0, "assets/ball.jpg", "")
    self:addActor(self.beatbutton,"img")
    self.beatbutton.onClick = function()
        self.beatradius = Circle(self, "fill", self.character.x + (self.character.pw / 2), self.character.y + (self.character.ph / 2), {1,1,1}, 200, 100)
        self:addActor(self.beatradius, "shape")
    end
    --------------------------------------------------------------------------------
    self.hpbar = Rectangle(self,"line",self.character.x - 1,self.character.y - 20,self.character.pw + 1,10, { 1,1,1 },0,0,5)
    self:addActor(self.hpbar, "shape")
    self.hp = Rectangle(self, "fill", self.character.x, self.character.y - 19, self.character.hp, 8, {1, 0, 0},0,0,5)
    self:addActor(self.hp, "shape")
    --SHAPEK--
    ---@type Shape
    love.graphics.setColor(255,0,0,255)
    self.rectangle = Rectangle(self,"line",self.character.x - 1,self.character.y - 20,self.character.pw + 2,10,0,0,5)
    --TEXT--
    self.f1 = Font("assets/font2.otf",64)
    self.t1 = Text(self,150,0,0,"meghalt az enemy",0.2,0.2,self.f1.font,64,{1,0,0})
    self:addActor(self.t1,"text")
    ---self.arrayimg = ArrayImage(self,0,0,200,200,{"assets/character.png","assets/enemy.png"},0)
    ---self:addActor(self.arrayimg,"img")
    --még ez csak probaslkozas pls nem torolni
    --[[ 
    self.beatbutton.onClick = function()
    end
    if (self.enemyactor.x > self.character.x - (self.enemyactor + 50))then
        self.enemyactor.hp = self.enemyactor.hp - 10;
        print( self.enemyactor.hp)
    end]]--
    --todo ArrayImage
end

