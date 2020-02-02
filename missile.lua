Missile = {x= 0, y =0 }

function Missile:new (o,x, y)
   o = o or {}
   setmetatable(o, self)
   self.__index = self
   self.x = x or 0
   self.y = y or 0
   self.image = love.graphics.newImage("images/missile.png")
   return o
end

function Missile:update()
    self.y = self.y - 5
end 

function Missile:getX()
    return self.x
end 

function Missile:getY()
    return self.y
end 






