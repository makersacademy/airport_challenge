class Weather

  def stormy?
    random_weather % 15 == 0
  end

  private

  def random_weather
    weather = rand(1..100)
  end
end
