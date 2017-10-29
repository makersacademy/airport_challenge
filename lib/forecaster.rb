class Forecaster

  attr_reader :get_forecast
  FORECAST = [false, false, false, true]

  def initialize
    @forecast = FORECAST
  end

  def current_forecast
    @forecast.sample && @forecast.sample
  end

end
