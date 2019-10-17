require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 5

attr_accessor :capacity
attr_reader :plane

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @landed = []
  end

  def take_off
    @landed.pop
    return "This plane has left the airport"
  end

  def land(planes)
    fail 'Airport is full' if @landed.count >= capacity
    @landed << planes
  end

end
