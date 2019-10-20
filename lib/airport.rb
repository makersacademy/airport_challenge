require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :plane

 def land(plane)
    fail 'Weather is stormy' unless sunny?
    @plane = plane
  end

  def take_off(plane)
    fail 'Weather is stormy' unless sunny?
    plane.left_airport
  end

  private

  def sunny?
    Weather.new.sunny
  end
end
