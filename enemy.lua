Enemy = {}
Enemy.__index = Enemy

function Enemy:new(x,y)
    local o = {}
    o.x = 0
    o.y = 0
    o.wScale = .1
    o.hScale = .1
    o.eX = x 
    o.eY = y
    setmetatable(o,enemy)
    return o
end

function Enemy:getX()
    return self.x
end 

function Enemy:getY()
    return self.y
end 

return Enemy



