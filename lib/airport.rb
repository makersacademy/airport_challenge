require_relative 'airplane'
require_relative 'weather'

class Airport

  def initialize(weather = Weather.new)
    @airplanes = []
    @weather = weather
  end

  def land(airplane)
    @airplanes << airplane unless @weather.stormy?
  end

  # for the take off we need to ensure the plane has previously landed
  # take_off(airplane) => look for plane in the array
  def take_off(airplane)
    @airplanes.select { |plane| plane == airplane }.first unless @weather.stormy?
  end

end
