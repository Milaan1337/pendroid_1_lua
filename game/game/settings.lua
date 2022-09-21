settings_table = {
    assets = {
        texts = {
            teszt = love.graphics.newText(love.graphics.getFont(),"Beállítások")
        },
        images = {
            background = love.graphics.newImage("files/optionsbackground.jpg");
            backbutton = {
                backbutton = love.graphics.newImage("files/backbutton.png");
                x = 0;
                y = 0;
            }
        }
    }
}
settings_table.assets.windows_w, settings_table.assets.windows_h = love.graphics.getDimensions();
function settings_draw()
    love.graphics.draw(settings_table.assets.images.background, 0, 0, 0, settings_table.assets.windows_w / settings_table.assets.images.background:getWidth(), settings_table.assets.windows_h / settings_table.assets.images.background:getHeight());
    love.graphics.draw(settings_table.assets.images.backbutton.backbutton);
    love.graphics.draw(settings_table.assets.texts.teszt,0,200);
end

function settings_click(x, y, button)
    if isInBox(x, y, settings_table.assets.images.backbutton.x, settings_table.assets.images.backbutton.y, settings_table.assets.images.backbutton.backbutton:getWidth(), settings_table.assets.images.backbutton.backbutton:getHeight()) then
        main_setCanvas(main.screens.menu)
    end
end