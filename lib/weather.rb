class Weather

  def stormy?
    random_weather == :stormy
  end

  def random_weather
    state = rand(8)
    state > 5 ? :stormy : :clear
  end

end
