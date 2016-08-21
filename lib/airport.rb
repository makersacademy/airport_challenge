require_relative 'weather'
#require_relative 'plane'

class Airport

  attr_accessor :planes
  attr_reader :capacity

  DEFAULT_CAPACITY = 35

  def initialize (capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land (plane, weather)
    fail "Planes aren't allowed to land during stormy weather" if weather.stormy?
    fail "Planes already landed aren't allowed to land again" unless plane.flying?
    if @planes.count >= @capacity
      false
    else
      #plane.flying(false)
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
