class Weather
  def stormy?
    generator = rand(10)
    generator.zero? # 10% chance of stormy weather
  end
end
