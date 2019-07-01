require_relative './airport.rb'
require_relative './weather.rb'
class AirPlane
  include Weather
  def initialize
    @inair = false
  end
  attr_reader :inair

  def land(airport)
    return "cannot land because plane not in air" unless @inair
    return "can only land at airport" unless airport.instance_of?(AirPort)
    return "stormy weather, cannot land" if stormy?
    return "airport full, cannot land" if airport.full?

    @inair = false
    airport.dock(self)
  end

  def goes_in_air
    @inair = true
  end
end
