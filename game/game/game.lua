game_table = {
    assets = {
        images = {
            background = love.graphics.newImage("files/gamebackground.jpg");
            character = {
                character = love.graphics.newImage("files/character.png");
                x = 20;
                y = 20;
            },
            enemy = {
                enemy = love.graphics.newImage("files/enemy.png");
                x = 0;
                y = 0;
            },
            backbutton = {
                backbutton = love.graphics.newImage("files/backbutton.png");
                x = 0;
                y = 0;
            }
        }
    }
}

game_table.assets.windows_w, game_table.assets.windows_h = love.graphics.getDimensions();
game_table.assets.images.character.x, game_table.assets.images.character.y = game_table.assets.windows_w / 2, game_table.assets.windows_h / 2;
function game_draw()
    love.graphics.draw(game_table.assets.images.background, 0, 0, 0, game_table.assets.windows_w / game_table.assets.images.background:getWidth(), game_table.assets.windows_h / game_table.assets.images.background:getHeight());
    love.graphics.draw(game_table.assets.images.backbutton.backbutton)
    love.graphics.draw(game_table.assets.images.character.character, game_table.assets.images.character.x, game_table.assets.images.character.y, 0, 0.3, 0.3)
    love.graphics.draw(game_table.assets.images.enemy.enemy, game_table.assets.images.enemy.x, game_table.assets.images.enemy.y, 0, 0.2, 0.2)

end


function game_update(dt)
    if love.keyboard.isDown("w") then
        game_table.assets.images.character.y =  game_table.assets.images.character.y - 10;
    end
    if love.keyboard.isDown("s") then
        game_table.assets.images.character.y =  game_table.assets.images.character.y + 10;
    end
    if love.keyboard.isDown("d") then
        game_table.assets.images.character.x =  game_table.assets.images.character.x + 10;
    end
    if love.keyboard.isDown("a") then
        game_table.assets.images.character.x =  game_table.assets.images.character.x - 10;
    end
    game_table.assets.images.enemy.x = game_table.assets.images.character.x + game_table.assets.images.character.x;
    game_table.assets.images.enemy.y = game_table.assets.images.character.y + game_table.assets.images.character.y * dt;
end

function points_between(p1, p2, points)
    
    x_spacing = (p2[1] - p1[1]) / (points + 1)
    y_spacing = (p2[2] - p1[2]) / (points + 1)

    return {{p1[0] + i * x_spacing}, {p1[1] +  i * y_spacing}} 
end
function game_click(x, y, button)
    print(points_between({0,0},{100,200},5))
    if isInBox(x, y, game_table.assets.images.backbutton.x, game_table.assets.images.backbutton.y, game_table.assets.images.backbutton.backbutton:getWidth(), game_table.assets.images.backbutton.backbutton:getHeight()) then
        main_setCanvas(main.screens.menu)
    end
end

