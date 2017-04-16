class Weather
  def stormy?
    @number == 0
  end

  def generate_weather
    @number = rand(4)
  end

end
