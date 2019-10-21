class Weather
  def stormy?
    rand(1..6) 
  end

  def forecast
    stormy? > 4 ? "Stormy" : "Sunny"
  end

  def bad_weather
    forecast == "Stormy" 
  end
end