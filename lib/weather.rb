class Weather
  def stormy?
    true if @number.zero?
  end

  def generate_weather
    @number = rand(4)
  end

end
