credits_table = {
    assets = {
        texts = {
            teszt = love.graphics.newText(love.graphics.getFont(),"Keszitok")
        }
    }
}

function credits_draw()
    love.graphics.draw(credits_table.assets.texts.teszt,0,200)
end