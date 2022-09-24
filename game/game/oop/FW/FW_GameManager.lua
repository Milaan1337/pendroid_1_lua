GameManager = Object:extend()
function GameManager:new()
    self.screens = {}
    self.currentScreen = nil
end

function GameManager:getType()
    return self
end

function GameManager:getCurrentScreen()
    return self.currentScreen
end

function GameManager:getScreens()
    return self.screens
end

function GameManager:AddScreen(screen_object,show)
    table.insert(self.screens,{screen = screen_object.screen,id = #self.screens})
    if (show) then
        GameManager:SetScreen(screen_object)
    end
end

function GameManager:SetScreen(screen)
    self.currentScreen = screen
end