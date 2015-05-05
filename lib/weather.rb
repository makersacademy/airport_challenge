module Forecast
  FORECAST = ["stormy", "sunny"]

  def Forecast.now
    FORECAST.sample
  end
end