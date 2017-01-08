class Weather

  def current_weather
    rand(100) <= 5 ? "stormy" : "sunny"
  end

end
