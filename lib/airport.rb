require_relative 'plane'
require_relative 'weather'

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
    print "Plane #{p} has left the airport"
    @planes.pop()
    # p @planes
  end

end
