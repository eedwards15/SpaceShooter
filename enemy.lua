Enemy = {}
Enemy.__index = Enemy

function Enemy:new(x,y)
    -- o = o or {}
    -- setmetatable(o, self)
    -- self.__index = self
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



