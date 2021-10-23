module WeatherReport
  def check_weather
    rand > 0.8 ? :stormy : :sunny
  end
end

class Weather
  include WeatherReport
end
