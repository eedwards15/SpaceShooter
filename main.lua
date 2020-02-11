GameState = {}

function love.load()
    setGlobalVariables()
   
    Enemies = {}

    player = {}
    player.imageHeight = 72
    player.imageWidth = 90
    player.x =  love.graphics.getWidth() / 2
    player.y =  love.graphics.getHeight() - player.imageHeight
    player.speed = 300 
    player.shots = {}
    player.coolDown = 1
    player.shootCoolDown =.05
    player.health = 5

    sprite = {}
    sprite.player = love.graphics.newImage("images/player_90_72.png")
    sprite.enemy = love.graphics.newImage("images/enemy.png")



end

function setGlobalVariables()
    screenWidth = love.graphics.getWidth()
    screenHeight = love.graphics.getHeight()
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
        for j,enemy in ipairs(Enemies) do
          if distanceBetween(enemy.x, enemy.y, shot.x, shot.y) < 70 then
            table.remove(player.shots, i)
            table.remove(Enemies,j)
          end
        end
    end

end

function love.draw()
    love.graphics.draw(sprite.player, player.x, player.y)
    
    for k, v in pairs(player.shots) do
        love.graphics.draw(love.graphics.newImage("images/missile.png"), v.x, v.y)
    end

    for k, v in pairs(Enemies) do
        love.graphics.draw(sprite.enemy, v.x, v.y, degreesToRadians(180),nil,nil, sprite.enemy:getWidth()/2, sprite.enemy:getHeight()/2)
    end

end

function degreesToRadians(degrees)
    return (degrees * math.pi /180)
end 

function distanceBetween(x1, y1, x2, y2)
    return math.sqrt((y2 - y1)^2 + (x2 - x1)^2)
  end
  

function love.keypressed( key, scancode, isrepeat )
    if key == "s" then 
        drawEnemey()
    end 
end

function drawEnemey()
    local enemy = {}
    enemy.x = player.x + 50
    enemy.y = player.y - 50
    table.insert(Enemies, enemy)
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