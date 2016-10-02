class Weather

  def current_weather
    weather = rand(1..5)
    weather == 5 ? :stormy : :sunny
  end

end
