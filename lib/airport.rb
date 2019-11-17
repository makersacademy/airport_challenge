class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    fail "The airport is full." if @planes.size >= 20
    print "Plane landed!"
    @planes << plane
  end

  def take_off
    print "Plane has taken off!"
    @planes.pop
  end

end

class Plane

  plane = Plane.new

end
