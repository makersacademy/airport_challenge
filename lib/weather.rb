class Weather
  @weather_types = ["cloudy", "clear"]
  def self.roll_weather
    # Kernel.rand(0..1)
    @weather_types[0]
  end

end
