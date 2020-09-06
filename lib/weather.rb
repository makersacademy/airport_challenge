class Weather

    DEFAULT_WEATHER = false


    def initialize(state = DEFAULT_WEATHER)
        @weather_state = state

    end

    def is_stormy?
        @weather_state
    
    end



end