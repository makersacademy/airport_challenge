class Weather
  def get_weather
    rand(10) == 0 ? 'stormy' : 'clear'
  end
end
