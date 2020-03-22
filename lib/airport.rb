require_relative 'plane'

class Airport
  def initialize(capacity)
    @hanger = []
    @capacity = capacity 
  end

  def land(plane)
    fail "Airport is full" unless @hanger.count < @capacity
   
    store(plane)
  end

  def store(plane)
    @hanger << plane 
  end

  def take_off(_plane)
    "Plane takes off!"
  end

  def left_airport(plane)
    @hanger.delete(plane)
  end

end
