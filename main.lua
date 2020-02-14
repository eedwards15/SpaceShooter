utils = require("helpers.utils")
Spawner = require("Spawner")

GameState = {}

function love.load()
    GameState.Score = 0 
    myFont = love.graphics.newFont(40)

    sprite = {}
    sprite.player = love.graphics.newImage("images/player_90_72.png")
    sprite.bullet = love.graphics.newImage("images/missile.png")

    screenWidth = love.graphics.getWidth()
    screenHeight = love.graphics.getHeight()
   
    Spawner.Load()

    player = {}
    player.imageHeight = 72
    player.imageWidth = 90
    player.x =  screenWidth / 2
    player.y =  love.graphics.getHeight() - player.imageHeight
    player.speed = 350 
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
        for j,e in ipairs(Spawner.Enemies) do
          if utils.distanceBetween(e.x, e.y, shot.x, shot.y) < (Spawner.sprite:getHeight()/2) then
            table.remove(player.shots, i)
            table.remove(Spawner.Enemies,j)
            GameState.Score = GameState.Score + 10
          end
        end
    end
    Spawner.Update()
end

function love.draw()
    love.graphics.draw(sprite.player, player.x, player.y)
    
    love.graphics.setFont(myFont)
    love.graphics.setColor(255, 255, 255)
    love.graphics.print("Score: " .. GameState.Score)

    for k, v in pairs(player.shots) do
        love.graphics.draw(sprite.bullet, v.x, v.y, nil, nil,nil, sprite.bullet:getWidth()/2, sprite.bullet:getHeight()/2)
    end

    Spawner.Draw()
end

function love.keypressed( key, scancode, isrepeat )
    if key == "s" then 
        Spawner.CreateEnemies()
    end 
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