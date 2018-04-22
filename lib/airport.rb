require "weather"

class Airport

  attr_accessor :planes, :DEFAULT_CAPACITY

  def initialize(capacity = 20)
    @planes = []
    @DEFAULT_CAPACITY = capacity
  end

  def land(plane, weather = Weather.new)
    raise "You are unable to land at this time" if weather.condition == "stormy" || @planes.length >= 20
    @planes << plane
  end

  def take_off(plane, weather = Weather.new)
    raise "It is too stormy for the plane to take off" if weather.condition == "stormy"
    @planes.delete(plane)
  end

  def is_plane_present?(plane)
    @planes.include?(plane)
  end

end
