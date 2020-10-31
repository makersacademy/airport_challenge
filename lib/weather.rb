class Weather
  def current_weather
    rand(1..5) == 1 ? 'stormy' : 'chill'
  end
end