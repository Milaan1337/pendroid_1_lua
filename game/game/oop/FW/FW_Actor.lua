Actor = Object:extend()

function Actor:new(x,y,w,h,rot)
    self.x = x
    self.y = y
    self.w = w
    self.h = h
    self.rotation = rot
end

function Actor:getType()
    return Actor
end

function Actor:getPosition()
    return self.x, self.y
end

function Actor:getSize()
    return self.w,self.h
end

function Actor:getRotation()
    return self.rotation
end

function Actor:setPosition(x,y)
    self.x,self.y = x,y
end

function Actor:setSize(w,h)
    self.w,self.h = w,h
end

function Actor:setRotation(rot)
    self.rotation = rot
end

function Actor:update(dt)

end