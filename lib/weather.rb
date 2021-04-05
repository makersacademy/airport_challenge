require 'airport'
class StormyWeather < StandardError
  def initialize(message)
    super(message)
  end
end

class Weather
  def stormy?
    "yes"
  end
end