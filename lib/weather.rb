class Weather
    attr_reader :weather_arr

    def initialize
       @weather_arr = ['Sunny', 'Stormy', 'Raining', 'Cloudy'] 
    end

    def set_weather
        @weather_arr[rand(0..3)]
    end
end