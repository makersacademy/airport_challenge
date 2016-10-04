class Weather

  def current_weather
    rand(1..5) == 5 ? :stormy : :sunny
  end

  def stormy?
    current_weather == :stormy
  end

end
