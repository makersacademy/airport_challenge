class Weather
  def weather_report
    Random.rand(100) > 85 ? "stormy" : "sunny"
  end
end