module Weather
  def generate_weather
    rand(1..100) <= 5 ? "Stormy" : "Sunny"
  end
end
