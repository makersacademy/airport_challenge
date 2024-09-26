class Weather
  attr_reader :conditions

  WEATHER_OPTIONS = ["Sunny", "Stormy", "Cloudy", "Rainy"].freeze

  def initialize(current_weather = WEATHER_OPTIONS.sample)
    @conditions = current_weather
  end

  def change
    current_weather = @conditions
    until current_weather != @conditions do
      @conditions = WEATHER_OPTIONS.sample
    end
  end
end
