class Weather
  
  def stormy?
    random_weather == :stormy
  end

  def random_weather
    rand(0..100) > 90 ? :stormy : :fine
  end

end
