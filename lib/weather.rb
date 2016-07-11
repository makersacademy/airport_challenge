require_relative 'airport'
class Weather
  def stormy?
    forecast == 1
  end
end

private

def forecast
  forecast = [1,2,3]
  forecast.sample
end
