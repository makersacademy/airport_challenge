class Weather
    def weather_check
        check_weather = rand(1..100)
        if check_weather >= 90
            return "stormy"
        else
            return "sunny"
        end
    end 
end 