require_relative 'plane'

class Airport

  def initialize
    @runway = []
  end

  def runway_traffic
    @runway
  end

  def land(plane)
    @runway << plane
  end

  def take_off(plane)
    @runway.delete(plane)
  end

end
