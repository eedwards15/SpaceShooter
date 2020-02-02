require "missile"
local player =  {}

    function player.load()
        player.image = love.graphics.newImage("images/player_90_72.png")
        print(player.image)
        player.x = 50
        player.y = 50
        player.speed = 300
        player.imageHeight = 72
        player.imageWidth = 90
        player.shots = {}
    end

    function player.setx(xvalue)
        player.x = xvalue
    end 

    function player.sety(yvalue)
        player.y = yvalue
    end

    function player.draw()
        love.graphics.draw(player.image, player.x, player.y)
    end

    function player.shoot()
        bullet={}
    	bullet.x= player.x + 20
        bullet.y= player.y
        table.insert(player.shots, bullet)
    end 

return player