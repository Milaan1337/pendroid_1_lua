credits_table = {
    assets = {
        texts = {
            keszitok = love.graphics.newText(love.graphics.getFont(),"Készítők");
            fellner = love.graphics.newText(love.graphics.getFont(),"Fellner Milán");
            nemeth = love.graphics.newText(love.graphics.getFont(),"Németh Csaba Bence");
            kancsal = love.graphics.newText(love.graphics.getFont(),"Kancsal Máté");
            zsebok = love.graphics.newText(love.graphics.getFont(),"Zsebők Dávid Ferenc");
        },
        fonts = {
            font = love.graphics.newFont("files/Mermaid1001.ttf", 30);
        },
        images = {
            background = love.graphics.newImage("files/foggy.png");
        }
    }
}
credits_table.window_w, credits_table.window_h = love.graphics.getDimensions()
credits_table.assets.texts.keszitok:setFont(credits_table.assets.fonts.font);
credits_table.assets.texts.fellner:setFont(credits_table.assets.fonts.font);
credits_table.assets.texts.nemeth:setFont(credits_table.assets.fonts.font);
credits_table.assets.texts.kancsal:setFont(credits_table.assets.fonts.font);
credits_table.assets.texts.zsebok:setFont(credits_table.assets.fonts.font);

function credits_draw()
    love.graphics.draw(credits_table.assets.images.background, 0, 0, 0, credits_table.window_w / credits_table.assets.images.background:getWidth(), credits_table.window_h / credits_table.assets.images.background:getHeight())
    love.graphics.draw(credits_table.assets.texts.keszitok, credits_table.window_w / 2 - credits_table.assets.texts.keszitok:getWidth() / 2, 50);
    love.graphics.draw(credits_table.assets.texts.fellner, credits_table.window_w / 2 - credits_table.assets.texts.fellner:getWidth() / 2, 150);
    love.graphics.draw(credits_table.assets.texts.nemeth, credits_table.window_w / 2 - credits_table.assets.texts.nemeth:getWidth() / 2, 200);
    love.graphics.draw(credits_table.assets.texts.kancsal, credits_table.window_w / 2 - credits_table.assets.texts.kancsal:getWidth() / 2, 250);
    love.graphics.draw(credits_table.assets.texts.zsebok, credits_table.window_w / 2 - credits_table.assets.texts.zsebok:getWidth() / 2, 300);
end