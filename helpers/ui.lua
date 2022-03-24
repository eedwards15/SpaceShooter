local class = {}

function class.DrawUI(score)
    class.myFont = love.graphics.newFont(40)
    love.graphics.setFont(class.myFont)
    love.graphics.setColor(255, 255, 255)
    love.graphics.print("Score: " .. score)
end 

return class 