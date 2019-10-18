class Weather
    attr_accessor :stormy
    def initialize
        @stormy = false 
    end

    def set_weather
        [true, false, false, false, false].sample
    end
end