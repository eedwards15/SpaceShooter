utils = require("helpers.utils")
enemy = require("enemy")

GameState = {}

function love.load()
    sprite = {}
    sprite.player = love.graphics.newImage("images/player_90_72.png")
    sprite.enemy = love.graphics.newImage("images/enemy.png")
    sprite.bullet = love.graphics.newImage("images/missile.png")

    screenWidth = love.graphics.getWidth()
    screenHeight = love.graphics.getHeight()
   
    Enemies = {}

    player = {}
    player.imageHeight = 72
    player.imageWidth = 90
    player.x =  screenWidth / 2
    player.y =  love.graphics.getHeight() - player.imageHeight
    player.speed = 300 
    player.shots = {}
    player.coolDown = 1
    player.shootCoolDown =.05
    player.health = 5
end

function love.update(dt)
     player.coolDown = player.coolDown - player.shootCoolDown

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
        shoot(dt)
    end 


    for k, shot in pairs(player.shots) do
        shot.y = shot.y - 10
        if shot.y < 0 then 
         table.remove(player.shots, k)
        end 
    end

    for i,shot in ipairs(player.shots) do
        for j,e in ipairs(Enemies) do
          if utils.distanceBetween(e.x, e.y, shot.x, shot.y) < 70 then
            table.remove(player.shots, i)
            table.remove(Enemies,j)
          end
        end
    end

end

function love.draw()
    love.graphics.draw(sprite.player, player.x, player.y)
    
    for k, v in pairs(player.shots) do
        love.graphics.draw(sprite.bullet, v.x, v.y, nil, nil,nil, sprite.bullet:getWidth()/2, sprite.bullet:getHeight()/2)
    end

    for k, v in pairs(Enemies) do
        love.graphics.draw(sprite.enemy, v:getX(),v:getY(), utils.degreesToRadians(180),nil,nil, sprite.enemy:getWidth()/2, sprite.enemy:getHeight()/2)
    end

end

function love.keypressed( key, scancode, isrepeat )
    if key == "s" then 
        drawEnemey()
    end 
end

function drawEnemey()
    local newEnemy = enemy:new(player.x + 50, player.y -50)
    -- local enemy = {}
    -- enemy.x = 
    -- enemy.y = player.y - 50
    table.insert(Enemies, newEnemy)
end

function shoot(dt)
    if  player.coolDown <= 0 then 
        player.bullets = {}
        player.bullets.x= player.x  + player.imageWidth / 2
        player.bullets.y= player.y

        table.insert(player.shots, player.bullets)
        player.coolDown = 1
    end 
end 