require 'plane'

class AirTrafficControl
  attr_accessor :planes
  @planes = Array.new

  def initialize(planes = [])
    @planes = planes
  end

  def land(plane)
    @planes << (plane)
  end

  def take_off(plane)
    @planes.delete(plane)
  end
end
