class Airport

  DEFAULT_CAPACITY = 5

  attr_accessor :capacity
  attr_reader :plane

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @landed = []
  end

  def take_off(plane)
    fail 'There are no planes in the airport' if @landed == []
    @landed.pop
    plane.in_airport = false
    return "This plane has left the airport"
    end

  def land(plane)
    fail 'Airport is full' if @landed.count >= capacity
    fail 'That plane is already in the airport' if two_planes(plane)
    plane.in_airport = true
    @landed << plane
    return @landed
  end

  def two_planes(plane)
    return @landed.include?(plane)
  end

end

class Plane

  attr_accessor :in_airport

  def initialize
    @in_airport = false
  end

  def landing?
    @in_airport
  end

end
