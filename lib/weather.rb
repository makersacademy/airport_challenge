class Weather
  def weather_report
    rand(1..20) == 1 ? "Stormy" : "Sunny"
  end
end