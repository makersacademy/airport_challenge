module Weather
  def stormy?
    generate_weather
  end

  private
  def generate_weather
    rand(1..4) % 3 == 0
  end
end
