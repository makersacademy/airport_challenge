class Weather
  def initialize
    @weather = ["sunny", "stormy"]
  end

  def weather_conditions
    @weather.shift
  end
end
