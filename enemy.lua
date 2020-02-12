Enemy = {}
Enemy.__index = Enemy

function Enemy:new(x,y)
    local o = {}
    o.x = x or 0
    o.y = y or 0
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



