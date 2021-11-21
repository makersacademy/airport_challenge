module Weather
  def get_weather
    rand(1..3) > 2 ? "Stormy" : "Sunny"
  end

end
