class Weather
  PERCENT_CHANCE_OF_STORMS = 100

  attr_reader :current_weather

    def initialize
      @current_weather = weather_check
    end

    def weather_check
      Random.rand(101/PERCENT_CHANCE_OF_STORMS).zero? ? :stormy : :sunny
    end
end