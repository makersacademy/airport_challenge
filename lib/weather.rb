class Weather
  def initialize
    random_weather
  end

  def random_weather
    #let the prob of storm is 1/7
    rand(7) == 1? true : false
  end
end
