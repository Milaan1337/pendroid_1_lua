game_table = {
    assets = {
        images = {
            background = love.graphics.newImage("files/gamebackground.jpg");
            character = {
                character = love.graphics.newImage("files/character.png");
                    x = 20;
                    y = 20;
                    hp = 100;
            },
            enemy = {
                enemy = love.graphics.newImage("files/enemy.png");
                    x = 0;
                    y = 0;
                    hp = 100;
            },
            backbutton = {
                backbutton = love.graphics.newImage("files/backbutton.png");
                x = 0;
                y = 0;
            }
        }
    }
}
game_table.assets.images.character.x,game_table.assets.images.character.y  = game_table.assets.images.character.cord
game_table.assets.windows_w, game_table.assets.windows_h = love.graphics.getDimensions();
game_table.assets.images.character.x, game_table.assets.images.character.y = game_table.assets.windows_w / 2, game_table.assets.windows_h / 2;




 function love.keypressed(key)
    if key == "space" then
        game_table.assets.images.enemy.hp = game_table.assets.images.enemy.hp - 10;
        print( game_table.assets.images.enemy.hp)
    end
 end



 
--------------------------------------------------------------------------------------

function game_draw()
    love.graphics.draw(game_table.assets.images.background, 0, 0, 0, game_table.assets.windows_w / game_table.assets.images.background:getWidth(), game_table.assets.windows_h / game_table.assets.images.background:getHeight());
    love.graphics.draw(game_table.assets.images.backbutton.backbutton)
    love.graphics.draw(game_table.assets.images.character.character, game_table.assets.images.character.x, game_table.assets.images.character.y, 0, 1, 1)
    love.graphics.draw(game_table.assets.images.enemy.enemy, game_table.assets.images.enemy.x, game_table.assets.images.enemy.y, 0, 1, 1)

    --itt fut le az, hogy lassuk a hitboxokat
    love.graphics.rectangle("line", game_table.assets.images.character.x, game_table.assets.images.character.y, charw, charh)
    love.graphics.rectangle("line", game_table.assets.images.enemy.x, game_table.assets.images.enemy.y, enew, eneh)
    --hp bar
    love.graphics.rectangle("line", game_table.assets.images.character.x - 1, game_table.assets.images.character.y - 20, game_table.assets.images.character.character:getWidth() + 2, 10)
    love.graphics.setColor(255,0,0,255)
    love.graphics.rectangle("fill", game_table.assets.images.character.x, game_table.assets.images.character.y - 19, game_table.assets.images.character.hp, 8)
    love.graphics.setColor(255,255,255)

end

function game_update(dt)
    --ezzel lehet allitani az enemy gyorsasagat
    x = 0.01
    --ez csak teszteleshez kell, majd kivesszuk, de nyilvanvaloan latszik hogy gombok kezelese
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

    if game_table.assets.images.enemy.hp == 0 then
        print("Meghalt a boss")
    end

    --itt van megirva, hogy az enemy kövesse a karaktert
    game_table.assets.images.enemy.x = game_table.assets.images.enemy.x + ((game_table.assets.images.character.x - game_table.assets.images.enemy.x) * x)
    game_table.assets.images.enemy.y = game_table.assets.images.enemy.y + ((game_table.assets.images.character.y - game_table.assets.images.enemy.y) * x)

    -----------------------------------------------------------------

    --ez egyszeruen a hitboxhoz kell, hogy minden lehetoseget kiprbbaljunk
    x1 = game_table.assets.images.character.x
    x2 = game_table.assets.images.enemy.x
    y1 = game_table.assets.images.character.y
    y2 = game_table.assets.images.enemy.y
    w1 = game_table.assets.images.character.character:getWidth();
    h1 = game_table.assets.images.character.character:getHeight();
    h2 = game_table.assets.images.enemy.enemy:getHeight();
    ew = game_table.assets.images.enemy.enemy:getWidth();

    --utkozes kezeles, minden lehetoseg figyelembe veve
    if (x1 < x2+ew and x2 < x1+w1 and y1 < y2+h2 and y2 < y1+h1) then
        if (game_table.assets.images.character.hp >= 1) then
            game_table.assets.images.character.hp = game_table.assets.images.character.hp - 1; 
            print(game_table.assets.images.character.hp)
        end
    end
    -------------------------------------------------------------------

    --ez csak azert van hogy folyamatos legyen a hitbox
    charw = game_table.assets.images.character.character:getWidth();
    charh = game_table.assets.images.character.character:getHeight();
    eneh = game_table.assets.images.enemy.enemy:getHeight();
    enew = game_table.assets.images.enemy.enemy:getWidth();

end

function game_click(x, y, button)
    if isInBox(x, y, game_table.assets.images.backbutton.x, game_table.assets.images.backbutton.y, game_table.assets.images.backbutton.backbutton:getWidth(), game_table.assets.images.backbutton.backbutton:getHeight()) then
        main_setCanvas(main.screens.menu)
    end
end

