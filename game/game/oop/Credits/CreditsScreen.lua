require "FW.FW_Screen"
---@class CreditsScreen : Screen
CreditsScreen = Screen:extend()

function CreditsScreen
:new(game)
    self.super.new(self,game)
    local assets = {
        path = "assets/ball.jpg",
        love2d = "assets.ball.jpg",
        type = self.assetManager.assetType.img,
    }
    for i,v in pairs(assets) do
        self.assetManager:Add(v)        
    end
    self.assetManager:LoadAssets(self)
end

function CreditsScreen:draw()
    for i,v in pairs(self.actors) do
        v.object:render()       
    end
end

function CreditsScreen:onStart()
    require "Credits.CreditActors.BackButton"
    require "Credits.CreditActors.CreditBackground"
    require "FW.FW_Font"
    require "FW.FW_Text"
    w, h = love.graphics.getDimensions()
    self.creditbackground = CreditBackground(self, 0, 0, w, h, 0, "assets/grass.png","")
    self:addActor(self.creditbackground,"img")
    self.backbutton = BackButton(self, 0, 0, 150, 50, 0, "assets/backbutton.png","")
    self:addActor(self.backbutton,"img")
    self.f1 = Font("assets/font2.otf",64)
    self.creators = Text(self,w / 2 - 100, 100, 0, "Creators:",0.6,0.6,self.f1.font, 32, {1,0,0})
    self:addActor(self.creators,"text")
    self.fellner = Text(self,w / 2 - 100,200,0,"Fellner Milán - Programmer",0.4,0.4,self.f1.font, 32, {1,0,0})
    self:addActor(self.fellner,"text")
    self.nemeth = Text(self,w / 2 - 100,300,0,"Németh Csaba Bence - Programmer",0.4,0.4,self.f1.font, 32, {1,0,0})
    self:addActor(self.nemeth,"text")
    self.kancsal = Text(self,w / 2 - 100,400,0,"Kancsal Máté - Designer",0.4,0.4,self.f1.font, 32, {1,0,0})
    self:addActor(self.kancsal,"text")
    self.zsebok = Text(self,w / 2 - 100,500,0,"Zsebők Dávid Ferenc - Programmer",0.4,0.4,self.f1.font, 32, {1,0,0})
    self:addActor(self.zsebok,"text")

end