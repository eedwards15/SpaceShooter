local class = {}

function class.DrawUI(score)
    love.graphics.setFont(myFont)
    love.graphics.setColor(255, 255, 255)
    love.graphics.print("Score: " .. score)
end 


return class 