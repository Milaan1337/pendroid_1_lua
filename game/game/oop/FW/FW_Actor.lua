Actor = Object:extend() -- Új objektúm
---Ez a funkció hozza létre az actorokat -> Actor
---@param x number
---@param y number
---@param w number
---@param h number
---@param rot number
function Actor:new(x,y,w,h,rot)
    self.x = x
    self.y = y
    self.w = w
    self.h = h
    self.rotation = rot
end
---Ez a funkció visszaadja az Actor típust.
---@return Actor_type
function Actor:getType()
    return Actor
end
---Ez a funkció visszaadja az Actor pozícióját
---@return x number
---@return y number
function Actor:getPosition()
    return self.x, self.y
end
---Ez a funkció visszaadja az Actor méretét.
---@return width number
---@return height number
function Actor:getSize()
    return self.w,self.h
end
---Ez a funkció visszaadja az Actor forgatását.
---@return rotation number
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
    self.x = self.x + 0.1
end

function Actor:onClick(istouch,presses)
    print("szar")
end