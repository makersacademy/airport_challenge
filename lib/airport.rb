require_relative 'plane'

class Airport

attr_reader :planes, :capacity

  def initialize(capacity=3)
    @capacity = capacity
    @planes = []
  end

  def full?
    if @planes.size == capacity
      true
    else
      false
    end
  end

  def land(plane)
     if full?
       raise ArgumentError, "Airport is full"
     else
      @planes << plane
    end
  end

  def takeoff(*)
     @planes.pop()
    # print "Plane has left the airport"
  end
end
