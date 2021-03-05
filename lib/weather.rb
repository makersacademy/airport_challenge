class Weather
  attr_accessor :weather_forecast

  def initialize(weather_forecast = 'sunny')
    @weather_forecast = weather_forecast
  end

end
