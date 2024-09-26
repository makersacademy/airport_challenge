
class Weather
  WEATHER_OPTIONS = ["clear", "stormy"]
  attr_accessor :forecast

  def initialize()
    @forecast = WEATHER_OPTIONS.sample
  end

end