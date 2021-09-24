module Weather
  def check_weather
    rand > 0.75 ? "stormy" : "sunny"
  end
end