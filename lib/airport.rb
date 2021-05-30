require_relative 'plane'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    plane.landed
    @planes.push(plane)
  end

  def take_off(plane)
    plane.taking_off
    @planes.delete(plane)
  end
end
