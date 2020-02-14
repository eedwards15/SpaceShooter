utils = require("helpers.utils")
Spawner = require("Spawner")
Player = require("player")
Ui = require("helpers.ui")
GameState = {}

function love.load()
    GameState.Score = 0 
    screenWidth = love.graphics.getWidth()
    screenHeight = love.graphics.getHeight()
    myFont = love.graphics.newFont(40)

    Player.Load()
    Spawner.Load()

    sprite = {}
    sprite.bullet = love.graphics.newImage("images/missile.png")
end

function love.update(dt)
     Player.coolDown = Player.coolDown - Player.shootCoolDown

    if love.keyboard.isDown("right") and Player.x < (screenHeight + Player.imageWidth) then
        Player.x = Player.x + (Player.speed * dt)
    end
    
    if love.keyboard.isDown("left") and Player.x > 0 then
        Player.x = Player.x - (Player.speed * dt)
    end

    if love.keyboard.isDown("down")  and Player.y < (screenHeight - Player.imageHeight) then
        Player.y = Player.y + (Player.speed * dt)
    end

    if love.keyboard.isDown("up") and Player.y > 0 then
        Player.y = Player.y - (Player.speed * dt)
    end

    if love.keyboard.isDown("space") then 
        Player.Shoot(dt)
    end 

    for k, shot in pairs(Player.shots) do
        shot.y = shot.y - 10
        if shot.y < 0 then 
         table.remove(Player.shots, k)
        end 
    end

    for i,shot in ipairs(Player.shots) do
        for j,e in ipairs(Spawner.Enemies) do
          if utils.distanceBetween(e.x, e.y, shot.x, shot.y) < (Spawner.sprite:getHeight()/2) then
            table.remove(Player.shots, i)
            Spawner.Destroy(j)
            GameState.Score = GameState.Score + 10
          end
        end
    end
    Spawner.Update(dt)
end

function love.draw()
    love.graphics.draw(Player.sprite, Player.x, Player.y)
    Ui.DrawUI(GameState.Score)
 
    for k, v in pairs(Player.shots) do
        love.graphics.draw(sprite.bullet, v.x, v.y, nil, nil,nil, sprite.bullet:getWidth()/2, sprite.bullet:getHeight()/2)
    end

    Spawner.Draw()
end


