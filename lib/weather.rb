class Weather
    attr_reader :weather
    
    def initialize
        @weather = "calm"
    end

    def weather_is_stormy
        @weather = "stormy"
    end

    def weather_is_calm
        @weather = "calm"
    end
end