require_relative 'planes'

# I have defined an airport's maximum capacity to be 16 planes

class Airport

  attr_reader :airport, :capacity

  def initialize
    @airport = []
    @capacity = 16
  end

  def land(plane)
    raise "Airport full!" if full?

    raise "Stormy weather, do not land!" if stormy?

    @airport << plane
    plane
  end

  def take_off(plane)
    raise "Stormy weather, do not take off!" if stormy?

    @airport.delete(plane)
    plane
  end

# I have decided that the chance of stormy weather is 20%
  def stormy?
    rand(1..5) == 1
  end

  def override_capacity(new_capacity)
    @capacity = new_capacity
  end

  private
  def full?
    @airport.count == @capacity
  end
end
