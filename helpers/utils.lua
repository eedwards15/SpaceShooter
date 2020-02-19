local utls = {}

function utls.distanceBetween(x1, y1, x2, y2)
    return math.sqrt((y2 - y1)^2 + (x2 - x1)^2)
end

function utls.degreesToRadians(degrees)
    return (degrees * math.pi /180)
end 


return utls