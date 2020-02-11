local player =  {}
    function player.load()
        sprite = {}
        sprite.player = love.graphics.newImage("images/player_90_72.png")

        player.imageHeight = 72
        player.imageWidth = 90
        player.x =  love.graphics.getWidth() / 2
        player.y =  love.graphics.getHeight() - player.imageHeight
        player.speed = 300 
        player.shots = {}
        player.coolDown = 1
        player.shootCoolDown =.05
        player.health = 5
    end

    function player.draw()
        love.graphics.draw(sprite.player, player.x, player.y)
    end

    function player.shoot(dt)
        if  player.coolDown <= 0 then 
            bullet={}
            bullet.x= player.x  + player.imageWidth / 2
            bullet.y= player.y

            table.insert(player.shots, bullet)
            player.coolDown = 1
        end 
    end 

return player