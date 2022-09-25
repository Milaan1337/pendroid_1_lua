---@class Actor : Object
---@field screen Screen
---@field x number
---@field y number
---@field w number
---@field h number
---@field rotation number
Actor = Object:extend() -- Új objektúm
function Actor:new(screen,x,y,w,h,rot)
    self.screen = screen
    self.x = x
    self.y = y
    self.w = w
    self.h = h
    self.rotation = rot
end
---Ez a funkció visszaadja az Actor típust.
---@return Actor
function Actor:getType()
    return Actor
end

function Actor:getScreen()
    return self.screen
end
---Ez a funkció visszaadja az Actor pozícióját
---@return number
---@return number
function Actor:getPosition()
    return self.x, self.y
end
---Ez a funkció visszaadja az Actor méretét.
---@return number
---@return number
function Actor:getSize()
    return self.w,self.h
end
---Ez a funkció visszaadja az Actor forgatását.
---@return number
function Actor:getRotation()
    return self.rotation
end
---Ez a funkció beállítja az actor pozicióját.
---@param x number
---@param y number
function Actor:setPosition(x,y)
    self.x,self.y = x,y
end
---Ez a funkció beállítja az actor méretét.
---@param w number
---@param h number
function Actor:setSize(w,h)
    self.w,self.h = w,h
end
---Ez a funkció beállítja az actor forgatását.
---@param rot number
function Actor:setRotation(rot)
    self.rotation = rot
end
---Ez a funkció lefut minden egyes képkockába
---@param dt number
function Actor:update(dt)
end

function Actor:onClick(istouch,presses)
end

function Actor:render()
    
end
---@field actor Actor
function Actor:isCollidedWith(actor)
    x1 = self.x
    x2 = actor.x
    y1 = self.y
    y2 = actor.y
    w1 = self.pw
    w2 = actor.pw
    h1 = self.ph
    h2 = actor.ph
    if (x1 < x2+w2 and x2 < x1+w1 and y1 < y2+h2 and y2 < y1+h1) then
        return true
    end

end

