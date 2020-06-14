require_relative 'plane.rb'

class Airport

  DEFAULT_CAPACITY = 10

  def initialze
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    fail 'Airport is at full capacity' if full_capacity?

    @planes << plane
  end

  def take_off(plane)

  end

  private

  def full_capacity?
    @planes.count >= @capacity
  end
end
