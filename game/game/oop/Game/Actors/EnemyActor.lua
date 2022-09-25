require "FW.FW_ImageActor"
EnemyActor = ImageActor:extend()

function EnemyActor:new(screen,x,y,w,h,rot,img)
    EnemyActor.super.new(self,screen,x,y,w,h,rot,img)
    self.speed = 0
    self.hp = 100
end

function EnemyActor:follow(character,speed)
    self.speed = speed
    self.x = self.x + ((character.x - self.x) * speed)
    self.y = self.y + ((character.y - self.y) * speed)
end
