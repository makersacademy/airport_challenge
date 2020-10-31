class Weather
  def current_weather
    roll = rand(1..5)
    return roll == 1 ? 'stormy' : 'chill'
  end
end