class Weather

    WEATHER_PREDICTIONS = ["stormy", "sunny", "sunny", "stormy", "sunny", "sunny", "sunny"]

    def initialize(weather_predictions=WEATHER_PREDICTIONS)
        @weather_predictions = weather_predictions
    end

    attr_accessor :weather_predictions

    def forecast
        weather_predictions[rand(0...weather_predictions.length)]
    end

    def stormy?
        forecast == "stormy" ? true : false
    end
end