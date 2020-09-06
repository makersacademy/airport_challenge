module Weather

def weather 
    rand(2) == 1 ? @weather_condition = "Sunny" : @weather_condition = "Stormy"
end

end

