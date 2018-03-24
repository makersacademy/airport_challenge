class Weather
  @weather_types = ["cloudy", "clear"]
  def self.roll_weather
    @weather_types[Kernel.rand(0..1)]
  end

end
