io.stdout:setvbuf('no')
function love.load()
    video = love.graphics.newVideo("video.ogv")
    video:play()
    love.window.setFullscreen(true,"exclusive")
end

function love.draw()
    love.graphics.draw(video)
end