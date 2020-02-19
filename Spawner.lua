enemy = require('enemy')
utils = require('helpers.utils')

Spawner = {}
Spawner.CoolDown = 6
Spawner.limit = 3 
Spawner.Enemies = {}

function Spawner.Load()
    Spawner.sprite = love.graphics.newImage("images/enemy.PNG")
end 

function Spawner.Update(dt)
    if Spawner.limit > 0 then 
        Spawner.CoolDown = Spawner.CoolDown - .05
    end 

    for k, v in pairs(Spawner.Enemies) do
        if Spawner.Enemies[k].wScale < 1 then 
            Spawner.Enemies[k].wScale = Spawner.Enemies[k].wScale  + .55 * dt 
        end 

        if Spawner.Enemies[k].x < Spawner.Enemies[k].eX  then 
            Spawner.Enemies[k].x =Spawner.Enemies[k].x + 150 * dt
        end 


        if Spawner.Enemies[k].hScale < 1 then 
            Spawner.Enemies[k].hScale = Spawner.Enemies[k].hScale  + .55 * dt
        end 

        if Spawner.Enemies[k].y < Spawner.Enemies[k].eY  then 
            Spawner.Enemies[k].y =Spawner.Enemies[k].y + 150 * dt
        end 
    end

    Spawner.CreateEnemies()
end

function Spawner.CreateEnemies()
    if Spawner.CoolDown <= 0 and Spawner.limit > 0 then 
        local x = math.random(Spawner.sprite:getWidth()/2, love.graphics.getWidth() - Spawner.sprite:getWidth())
        local y = math.random(Spawner.sprite:getHeight(), love.graphics.getHeight()/2)
        local newEnemy = enemy:new(x, y)

        table.insert(Spawner.Enemies , newEnemy)
        Spawner.CoolDown= 5
        Spawner.limit = Spawner.limit -1 
    end 

end

function Spawner.Destroy(index)
    table.remove(Spawner.Enemies,index)
    Spawner.limit = Spawner.limit + 1
end

function Spawner.Draw()
    for k, v in pairs(Spawner.Enemies) do
        love.graphics.draw(Spawner.sprite, v:getX(),v:getY(), utils.degreesToRadians(180),v.wScale,v.hScale,Spawner.sprite:getWidth()/2, Spawner.sprite:getHeight()/2)
    end
end 

return Spawner
