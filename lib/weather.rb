class Weather

  def initialize(weather = 7)
    @weather = weather
  end

  def check_weather
    @weather = rand(10)
  end

  def stormy?
    check_weather < 3
  end

end
