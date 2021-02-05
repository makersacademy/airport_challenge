require_relative 'airport'

class Weather
  def stormy?
    @weather_today = rand(1..10)
    return true if @weather_today > 8
  end
end