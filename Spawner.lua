enemy = require('enemy')
utils = require('helpers.utils')

Spawner = {}
Spawner.CoolDown = 6
Spawner.Enemies = {}

function Spawner.Load()
    Spawner.sprite = love.graphics.newImage("images/enemy.png")
end 

function Spawner.Update()
    Spawner.CoolDown = Spawner.CoolDown - .05
    Spawner.CreateEnemies()
end


function Spawner.CreateEnemies()
    if Spawner.CoolDown <= 0 then 
        local x = math.random(Spawner.sprite:getWidth()/2, love.graphics.getWidth() - Spawner.sprite:getWidth())
        local y = math.random(Spawner.sprite:getHeight(), love.graphics.getHeight()/2)
        local newEnemy = enemy:new(x, y)
        table.insert(Spawner.Enemies , newEnemy)
        Spawner.CoolDown= 5
    end 

end

function Spawner.Draw()
    for k, v in pairs(Spawner.Enemies) do
        love.graphics.draw(Spawner.sprite, v:getX(),v:getY(), utils.degreesToRadians(180),nil,nil,Spawner.sprite:getWidth()/2, Spawner.sprite:getHeight()/2)
    end
end 

return Spawner
