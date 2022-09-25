require "FW.FW_ImageActor"
Button = ImageActor:extend()

function Button:new(screen,x,y,w,h,rot,img,text,tw,th,font,color)
    Button.super.new(self,screen,x,y,w,h,rot,img)
    self.color = color or {1,1,1,1}
    self.tw = tw or 0.5
    self.th = th or 0.5
    self.size = 72
    self.font = font or love.graphics.newFont("assets/font2.otf",self.size,"normal",love.graphics.getDPIScale())
    self.text = {
        text = love.graphics.newText(self.font,text),
        x = 0,
        y = 0,
    }
end

function Button:render()
    love.graphics.draw(self.actor,self.x,self.y,self.rotation,self.w,self.h)
    love.graphics.setColor(self.color[1],self.color[2],self.color[3])
    love.graphics.draw(self.text.text,self.x + (self.pw/2) - (self.text.text:getWidth() * self.tw)/2,self.y + (self.ph/2) - (self.size * self.th)/2,self.rotation,self.tw,self.th)
    love.graphics.setColor(1,1,1,1)
end