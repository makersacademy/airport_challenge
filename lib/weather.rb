class WeatherGenerator
  attr_reader :weather_array

  def initialize
    @weather_array = ["sunny", "rainy", "clear", "stormy"]
  end

  def random_weather
    @weather_array[rand(0..3)]
  end
end
