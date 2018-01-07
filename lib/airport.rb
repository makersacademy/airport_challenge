require_relative 'plane'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def dispatch(plane)
    raise 'Plane not present in airport' unless has?(plane)
    plane.set_location(nil)
    @planes.delete(plane)
  end

  def receive(plane)
    raise 'Plane already present in airport' if has?(plane)
    plane.set_location(self)
    @planes << plane
  end

  private
  def has?(plane)
    @planes.include?(plane)
  end
end
