class Weather
  attr_accessor :weather

  def initialize
    @weather = ["sunny", "sunny", "sunny", "sunny", "sunny", "stormy"]
  end

  # def current_weather
  #   @weather[rand(0..5)]
  # end

  def current_weather
    return @weather[Kernel.rand(0..5)]
    # return true if @weather_for_now == "stormy"
    # false
  end

end

# weather = Weather.new
# puts weather.current_weather
