class Weather

  def check_weather
    chance < 85 ? "sunny" : "stormy"
  end

  private

  def chance
    rand(0...100)
  end

end
