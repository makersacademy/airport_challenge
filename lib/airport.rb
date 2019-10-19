class Airport

  DEFAULT_CAPACITY = 5

  attr_accessor :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @landed = []
  end

  def take_off
    fail 'There are no planes in the airport' if @landed == []
    @landed.pop
    return "This plane has left the airport"
  end

  def land(planes)
    fail 'Airport is full' if @landed.count >= capacity
    @landed << planes
    return @landed
    #fail 'That plane is already in the airport' if @landed.include?planes == true
  end

end

class Plane

  def flying?
    true
  end

end
