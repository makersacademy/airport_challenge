class Weather

    def current_weather
        rand(1..6) > 5 ? "stormy" : "sunny"
    end

end
