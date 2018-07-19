class Weather
  def generate_weather
    rand(1..10)
  end

  def stormy?
    generate_weather >= 9
  end
end
