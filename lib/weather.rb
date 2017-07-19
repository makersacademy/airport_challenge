
class Weather
    
    def random_weather_generator
        if rand(0..5) > 3
            @weather = "Stromy"
        else
            @weather = "Sunny"
        end
    end
    
    
end