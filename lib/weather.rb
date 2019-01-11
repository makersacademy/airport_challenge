class Weather
  def initialize
    @weather_options = ["stormy", "sunny"]
  end

  def random_weather
    @weather_options.sample
  end
end
