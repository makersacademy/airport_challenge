require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
    @capacity = 10
  end

  def dispatch(plane)
    raise 'Plane not present in airport' unless has?(plane)
    raise 'Plane cannot take off in stormy weather' if adverse_conditions?
    plane.set_location(nil)
    @planes.delete(plane)
  end

  def receive(plane)
    raise 'Plane already present in airport' if has?(plane)
    raise 'Airport does not have capacity' if full?
    raise 'Plane cannot land in stormy weather' if adverse_conditions?
    plane.set_location(self)
    @planes << plane
  end

  private
  def has?(plane)
    @planes.include?(plane)
  end

  def adverse_conditions?
    Weather.new.stormy?
  end

  def full?
    @planes.length >= @capacity
  end
end
