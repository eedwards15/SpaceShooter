local class = {}

function class.load()
    class.sprite ={}

    --Loading Bullet Information 
    class.sprite.bullet = {} 
    class.sprite.bullet.image = love.graphics.newImage("images/missile.png")
    class.sprite.bullet.width = class.sprite.bullet.image:getWidth()
    class.sprite.bullet.height = class.sprite.bullet.image:getHeight()

    --Player Images 
    class.sprite.player = {} 
    class.sprite.player.image = love.graphics.newImage("images/player_90_72.png")
    class.sprite.player.width = class.sprite.player.image:getWidth()
    class.sprite.player.height = class.sprite.player.image:getHeight() 
end 

return class