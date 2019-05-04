require_relative 'plane'
class Airport
  attr_reader :planes
  def initialize
    @planes = []
  end

  def land(plane)
    raise "Plane already at the airport!" if planes.include?(plane)

    planes << plane
  end

  def take_off(plane)
    planes.delete(plane)
    planes
  end
end
