require_relative 'plane'

class Airport
  attr_reader :planes
  def initialize
    @planes = []
  end

  def land(plane)
    @plane = plane
    @planes << @plane
  end

  def take_off
    @planes.pop
  end
end