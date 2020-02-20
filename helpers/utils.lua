local utls = {}

function utls.distanceBetween(x1, y1, x2, y2)
    return math.sqrt((y2 - y1)^2 + (x2 - x1)^2)
end

function utls.degreesToRadians(degrees)
    return (degrees * math.pi /180)
end 

function utls.collison(x1, x2,y1,y2, width1,width2, height1,height2)
   return (x1 < x2 + width2 and 
    x1 + width1 > x2 and
    y1 < y2 + height2 and 
    y1 + height1 > y2)

end 

return utls