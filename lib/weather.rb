def weather_forecaster
    weather_prob = rand(1..10)
    weather = ""
    weather_prob <= 7 ? weather = "good" : weather = "stormy"    #70% chance of good weather!
end



#10.times {puts weather_forecaster}