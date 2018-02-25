require_relative 'airport'

class Weather
  def stormy?
    weather_forecast == :stormy
  end

private

  FORECAST = [:fine, :stormy, :fine, :fine, :fine]

  def weather_forecast
    FORECAST.sample
  end

end
