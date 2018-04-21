class Weather
  def stormy?
    generate_weather
  end

  private

  def generate_weather
    rand(5) == 1
  end
end
