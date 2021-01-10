class Weather
  def weather_report
    return rand(1..8) <= 6 ? "sunny" : "stormy"
  end
end
