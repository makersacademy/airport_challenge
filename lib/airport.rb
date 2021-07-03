require_relative 'plane'

class Airport
  attr_reader :planes, :capacity

  def initialize(capacity = 1)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    @planes.length >= @capacity ? (raise "Airport full.") : plane_in(plane); @planes << plane
  end

  def take_off(plane)
    @planes.delete(plane); plane_out(plane)
  end

  def plane_in(plane)
    plane.status = 'In airport'
  end

  def plane_out(plane)
    plane.status = 'Not in airport'
  end
end 