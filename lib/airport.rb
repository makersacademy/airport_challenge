class Airport

DEFAULT_CAPACITY = 20

  attr_reader :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    fail "Stormy weather!  Try again later." if stormy_weather?
    plane.land
    @hangar << plane
  end

  def takeoff(plane)
    fail "Stormy weather!  Try again later." if stormy_weather?
    plane.takeoff
    @hangar.delete_if {|elem| elem == plane }
  end

  def full?
    raise "Airport is full!" if @hangar.length > @capacity
  end

  def stormy_weather?
    Random.rand(10).zero?  # 10% chance of storms?
  end
end