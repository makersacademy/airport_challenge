class Weather

  def stormy?
    random_weather > 4
  end

  private

  def random_weather
    rand(1..6)
  end

end
