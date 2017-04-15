require_relative 'plane.rb'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    plane.land
    @planes << plane
  end

  def takeoff(plane)
    plane.takeoff
    @planes -= [plane]
  end

  def in_airport?(plane)
    @planes.include?(plane)
  end
end
