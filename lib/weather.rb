class Weather
  attr_reader
  def weather_forecast
    weather = %w[stormy sunny rainy clear windy].sample
    if weather.include?('stormy')
      return true
    end
  end
end
