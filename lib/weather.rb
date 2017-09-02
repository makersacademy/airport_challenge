class Weather
attr_reader :forecast
FORECAST_STORM = 20

  def initialize(forecast = FORECAST_STORM)
    @forecast = forecast
  end

  def stormy?
    forecast > 1
  end

end
