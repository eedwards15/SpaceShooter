MissileObj = require("missile")
local player = {}
    function player.Load()
        player.sprite =  love.graphics.newImage("images/player_90_72.png")
        player.imageHeight = player.sprite:getHeight()
        player.imageWidth = player.sprite:getWidth()
        player.x = 0
        player.y = 0
        player.speed = 350 
        player.shots = {}
        player.coolDown = 1
        player.shootCoolDown =.05
        player.health = 5
    end

    function player.Draw()
        love.graphics.draw(sprite.player, player.x, player.y)
    end

    function player.Shoot(dt)
        if  player.coolDown <= 0 then
            bullet={}
            bullet.x= player.x  + player.imageWidth / 2
            bullet.y= player.y

            table.insert(player.shots, bullet)
            player.coolDown = 1
        end
    end

return player