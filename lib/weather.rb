class Weather

  def chance
    rand(0...100)
  end

  def check_weather
    chance < 85 ? "sunny" : "stormy"
  end
end
