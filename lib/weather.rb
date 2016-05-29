class Weather

  def initialize(weather_array = ['Fine', 'Overcast', 'Light Rain', 'Breezey', 'Stormy'])
    @weather_array = weather_array
  end

  def get_weather
    @weather_array[rand(5)]
  end

end