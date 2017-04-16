class Weather
  def stormy?
    true if @number = 0
  end

  def generate_weather
    @number = rand(2)
  end

end
