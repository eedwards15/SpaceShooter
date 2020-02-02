player = require("player")

function love.load()
    setGlobalVariables()
    player.load()
end

function setGlobalVariables()
    screenWidth = love.graphics.getWidth()
    screenHeight = love.graphics.getHeight()
end

function love.update(dt)
    if love.keyboard.isDown("right") and player.x < (screenHeight + player.imageWidth) then
        player.x = player.x + (player.speed * dt)
    end
    if love.keyboard.isDown("left") and player.x > 0 then
        player.x = player.x - (player.speed * dt)
    end

    if love.keyboard.isDown("down")  and player.y < (screenHeight - player.imageHeight) then
        player.y = player.y + (player.speed * dt)
    end

    if love.keyboard.isDown("up") and player.y > 0 then
        player.y = player.y - (player.speed * dt)
    end

    if love.keyboard.isDown("space") then 
        player.shoot()
    end 


    for k, v in pairs(player.shots) do
        v.y = v.y - 20
        if v.y < 0 then 
         table.remove(player.shots, k)
        end 

    end
 
end

function love.draw()
    player.draw()

    for k, v in pairs(player.shots) do
        love.graphics.draw(love.graphics.newImage("images/missile.png"), v.x, v.y)
    end
end
