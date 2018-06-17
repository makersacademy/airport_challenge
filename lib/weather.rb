
class Weather
  attr_reader :stormy, :weather
  WEATHER = [:stormy, :sunny, :sunny, :sunny]

  def random_weather
    index = Random.rand(4)
    WEATHER[index]
  end

  def stormy?
    random_weather == :stormy
  end


end
