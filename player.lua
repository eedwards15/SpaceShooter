MissileObj = require("missile")
local player = {}
    function player.Load(width, height)
        player.x = 0
        player.y = 0
        player.width = width 
        player.height = height
        player.speed = 350 
        player.shots = {}
        player.coolDown = 1
        player.shootCoolDown =.05
        player.health = 5
    end

    function player.Shoot(dt)
        if  player.coolDown <= 0 then
            bullet={}
            bullet.x= player.x  + player.width / 2
            bullet.y= player.y

            table.insert(player.shots, bullet)
            player.coolDown = 1
        end
    end

return player