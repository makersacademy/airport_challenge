class Weather
    def initialise(forecast)
        @weather = forecast
    end

    def storm
        chance = rand(6)
        if chance == 5
            return @weather = "storm"
        else
            return @weather = "clear"
        end
    end
end