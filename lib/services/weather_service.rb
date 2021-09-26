class WeatherService
  def weather_report
    if rand(1..10) == 1
      :storm
    else
      :clear
    end
  end
end
