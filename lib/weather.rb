
class Weather
    WEATHER_OUTLOOK = [:clear, :sunny, :rainy, :stormy, :windy, :snowy, :cloudy, :foggy]
    def self.condition
        WEATHER_OUTLOOK.sample
    end

end