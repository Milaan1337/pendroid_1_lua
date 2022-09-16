settings_table = {
    assets = {
        texts = {
            teszt = love.graphics.newText(love.graphics.getFont(),"Cigany Timo")
        }
    }
}

function settings_draw()
    love.graphics.draw(settings_table.assets.texts.teszt,0,200)
end