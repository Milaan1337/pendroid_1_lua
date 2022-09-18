game_table = {
    assets = {
        images = {
            background = love.graphics.newImage("files/gamebackground.jpg");
            character = love.graphics.newImage("files/character.png");
            backbutton = {
                backbutton = love.graphics.newImage("files/backbutton.png");
                x = 0;
                y = 0;
            }
        }
    }
}

game_table.assets.windows_w, game_table.assets.windows_h = love.graphics.getDimensions();

function game_draw()
    love.graphics.draw(game_table.assets.images.background, 0, 0, 0, game_table.assets.windows_w / game_table.assets.images.background:getWidth(), game_table.assets.windows_h / game_table.assets.images.background:getHeight());
    love.graphics.draw(game_table.assets.images.backbutton.backbutton)
    love.graphics.draw(game_table.assets.images.character, game_table.assets.windows_w /2, game_table.assets.windows_h / 2, 0)

end
function game_click(x, y, button)
    if isInBox(x, y, game_table.assets.images.backbutton.x, game_table.assets.images.backbutton.y, game_table.assets.images.backbutton.backbutton:getWidth(), game_table.assets.images.backbutton.backbutton:getHeight()) then
        main_setCanvas(main.screens.menu)
    end
end

