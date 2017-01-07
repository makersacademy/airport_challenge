class Weather
    def stormy?
        random_weather == :stormy
    end
    
    private
    
    FORECAST = [:stormy, :clear, :clear, :clear]
    
    def random_weather
        FORECAST.sample
    end
end