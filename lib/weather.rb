class Weather
  def weather_report
    return rand(1..10) <= 8 ? "sunny" : "stormy"
  end
end
