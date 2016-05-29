class Weather
    def stormy?
        rand(1..2) == 1
    end
end

class NoWeather
    def stormy?
        false
    end
end