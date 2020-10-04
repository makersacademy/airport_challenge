class Airport

  attr_reader :plane
  attr_reader :capacity
  attr_reader :planes

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "The airport is full!" if @planes.count == @capacity
    fail "Cannot land plane: Storms" if storms?

    plane.land
    @planes << plane
    
  end

  def take_off(plane)
    fail "Cannot take off: #{plane} is not at the airport" unless @planes.detect { |h| h == plane }
    fail "Cannot take off: storms" if storms?
   
    plane.take_off
    @planes.delete_if { |h| h == plane }
  end

  def storms?
    rand(1..5) > 4
  end
end
