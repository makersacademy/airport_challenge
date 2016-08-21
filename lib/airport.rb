require_relative 'weather'

class Airport

  attr_accessor :planes
  attr_reader :capacity

  DEFAULT_CAPACITY = 35

  def initialize (capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land (plane, weather)
    fail "Planes aren't allowed to take off during stormy weather" if weather.stormy?
    if @planes.count >= @capacity
      false
    else
      planes << plane
      plane
    end
  end

  def take_off (plane, weather)
    fail "Planes aren't allowed to take off during stormy weather" if weather.stormy?
    fail "Plane is already in the air" if plane.flying?
    planes.delete(plane)
  end

end
