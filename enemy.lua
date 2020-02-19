Enemy = {}
Enemy.__index = Enemy

function Enemy:new(x,y)
    local o = {}
    o.x = x
    o.y = 0
    o.wScale = .1
    o.hScale = .1
    o.eX = x 
    o.eY = y
    o.speed = 150
    o.bullets = {}
    o.shootCoolDown = 5
    setmetatable(o,enemy)


    return o
end

function Enemy:getX()
    return self.x
end 

function Enemy:getY()
    return self.y
end 

function Enemy:shoot()
    bullet={}
    bullet.x= self.x 
    bullet.y= self.y
    table.insert(self.bullets, bullet)
    self.shootCoolDown = 5
end 

return Enemy



