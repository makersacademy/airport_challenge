require_relative 'plane'

class Airport

attr_reader :plane

  def initialize
    @plane = []
  end

  def land(plane)
    @plane << plane
  end

  def take_off(plane)
    @plane.pop
  end

end
