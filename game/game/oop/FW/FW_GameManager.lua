GameManager = Object:extend()
---Ez a funkció létrehozza a GameManager-t.
function GameManager:new()
    self.screens = {}
    self.currentScreen = nil
end

function GameManager:update(dt)
    --Main update, mindenhol lefut
    self.currentScreen:update(dt)
end
---Ez a funkció visszaadja a GameManager típust.
---@return GameManager type
function GameManager:getType()
    return self
end
---Ez a funkció visszaadja a jelenlegi aktív képernyőt.
---@return currentScreen Screen
function GameManager:getCurrentScreen()
    return self.currentScreen
end
---Ez a funkció visszaadja a képernyőket.
---@return screens table
function GameManager:getScreens()
    return self.screens
end
---Ez a funkció hozzáad egy képernyőt, a GameManager-hez.
---@param screen_object Screen
---@param show bool
function GameManager:AddScreen(screen_object,show)
    table.insert(self.screens,{screen = screen_object.screen,id = #self.screens})
    if (show) then
        GameManager:SetScreen(screen_object)
    end
end
---Ez a funkció beállítja az aktív képernyőt.
---@param screen Screen
function GameManager:SetScreen(screen)
    self.currentScreen = screen
end