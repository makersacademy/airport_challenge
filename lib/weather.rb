class Weather
  def initialize
    random_weather
  end

  def random_weather
   rand(7) == 1 ? true : false
  end
end
