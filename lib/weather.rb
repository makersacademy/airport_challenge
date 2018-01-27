class Weather
  def stormy?
    random_weather == :stormy
  end

  def random_weather
    possible_weather = [:stormy, :sunny, :sunny, :sunny]
    possible_weather.sample
  end
end
