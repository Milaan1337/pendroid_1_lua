credits_table = {
    assets = {
        texts = {
            keszitok = love.graphics.newText(love.graphics.getFont(),"Készítők"),
            credit_members = {
                fellner = love.graphics.newText(love.graphics.getFont(),"Fellner Milán");
                nemeth = love.graphics.newText(love.graphics.getFont(),"Németh Csaba Bence");
                kancsal = love.graphics.newText(love.graphics.getFont(),"Kancsal Máté");
                zsebok = love.graphics.newText(love.graphics.getFont(),"Zsebők Dávid Ferenc");
            },
        },
        fonts = {
            font = love.graphics.newFont("files/Mermaid1001.ttf", 30);
        },
        images = {
            background = love.graphics.newImage("files/foggy.png");
        }
    },
}
--#region Tábla utólag megadott értékei
credits_table.window_w, credits_table.window_h = love.graphics.getDimensions()
credits_table.assets.texts.keszitok:setFont(credits_table.assets.fonts.font);
for i,v in pairs(credits_table.assets.texts.credit_members) do
    v:setFont(credits_table.assets.fonts.font);
end
--#endregion

function credits_draw()
    --#region Base Textek
    love.graphics.draw(credits_table.assets.images.background, 0, 0, 0, credits_table.window_w / credits_table.assets.images.background:getWidth(), credits_table.window_h / credits_table.assets.images.background:getHeight())
    love.graphics.draw(credits_table.assets.texts.keszitok, credits_table.window_w / 2 - credits_table.assets.texts.keszitok:getWidth() / 2, 50);
    --#endregion
    --#region Credit_members
    local y_index = 150
    for i,v in pairs(credits_table.assets.texts.credit_members) do
        love.graphics.draw(v, credits_table.window_w / 2 - v:getWidth() / 2, y_index);
        y_index = y_index + 50        
    end
    --#endregion
end