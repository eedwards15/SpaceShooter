utils = require("helpers.utils")
Spawner = require("Spawner")
Player = require("player")
Ui = require("helpers.ui")
SpriteLoader = require("SpriteLoader")
GameState = {}

function love.load()
    GameState.Score = 0 
    screenWidth = love.graphics.getWidth()
    screenHeight = love.graphics.getHeight()

    Spawner.Load()   
    SpriteLoader.load()
    Player.Load(SpriteLoader.sprite.player.width, SpriteLoader.sprite.player.height)
end

function love.update(dt)
     Player.coolDown = Player.coolDown - Player.shootCoolDown

    if love.keyboard.isDown("right") and Player.x < (screenHeight + Player.width) then
        Player.x = Player.x + (Player.speed * dt)
    end
    
    if love.keyboard.isDown("left") and Player.x > 0 then
        Player.x = Player.x - (Player.speed * dt)
    end

    if love.keyboard.isDown("down")  and Player.y < (screenHeight - Player.height) then
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

    for j,e in ipairs(Spawner.Enemies) do
        for eBulletIndex, eBullet in ipairs(e.bullets) do 
            collison = utils.collison(eBullet.x,Player.x,eBullet.y,Player.y, SpriteLoader.sprite.bullet.width ,Player.width,SpriteLoader.sprite.bullet.height,Player.height);
            if collison == true then
                GameState.Score = GameState.Score - 10
                table.remove(e.bullets,eBulletIndex)
            end
        end
    end

    for i,shot in ipairs(Player.shots) do
        for j,e in ipairs(Spawner.Enemies) do
            collison = utils.collison(e.x,shot.x,e.y,shot.y,Spawner.sprite:getWidth(), SpriteLoader.sprite.bullet.width,Spawner.sprite:getHeight(),SpriteLoader.sprite.bullet.height)
            if collison and Spawner.Enemies[j].canBeHit then
                table.remove(Player.shots, i)
                Spawner.Destroy(j)
                GameState.Score = GameState.Score + 10
            end
        end
    end
    Spawner.Update(dt)
end

function love.draw()
    love.graphics.draw(SpriteLoader.sprite.player.image, Player.x, Player.y)
    Ui.DrawUI(GameState.Score)
    for k, v in pairs(Player.shots) do
        love.graphics.draw(SpriteLoader.sprite.bullet.image,v.x, v.y, nil, nil,nil,SpriteLoader.sprite.bullet.width/2,SpriteLoader.sprite.bullet.height/2)
    end
    Spawner.Draw()
end


