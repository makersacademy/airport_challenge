require_relative 'plane'

class Airport

  attr_accessor :planes

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def check_plane_status(plane)
    @planes.include?(plane) ? "Plane in airport" : "Plane not in airport"
  end

end
