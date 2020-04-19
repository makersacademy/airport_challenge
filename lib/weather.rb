class WeatherGenerator
  attr_reader :weather_array

  def initialize
    @weather_array = ["sunny", "rainy", "clear", "stormy"]
  end

  def random
    rand(0..3)
  end

  def weather
    @weather_array[self.random]
  end
end
