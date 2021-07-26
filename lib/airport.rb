require "plane"
require "weather"

class AirPort

  attr_reader :airport_hanger
  attr_reader :capacity

  DEFAULT_CAPACITY = 20

  def initialize(user_capacity = DEFAULT_CAPACITY)
    @airport_hanger = []
    @capacity = user_capacity
  end
  
  def land(plane, weather)
    fail "Cannot land in stormy weather" if weather.stormy?
    fail "Airport hanger is full" if self.full?
    airport_hanger << plane
  end

  def takeoff(plane, weather)
    fail "Cannot take off in stormy weather" if weather.stormy?
    plane.start_flying
    airport_hanger.delete(plane)
  end


  def full?
    airport_hanger.count >= capacity
  end

end
