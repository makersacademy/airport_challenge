require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "Airport full" if full?

    raise "Plane not flying" unless plane.flying

    plane.landed
    @planes << plane
  end

  def take_off(plane)
    raise "Plane not in airport" unless at_airport(plane)

    plane.is_flying
    @planes.pop
  end

  attr_reader :planes, :capacity

  private
  def full?
    @planes.count >= DEFAULT_CAPACITY
  end

  def at_airport(plane)
    @planes.include?(plane)
  end


end
