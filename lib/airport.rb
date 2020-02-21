require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :plane
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @plane = []
  end


  def land
    Plane.new
  end


  def store(plane)
    fail 'Airport full' if full?
    @plane << plane
    return plane
  end


  def take_off
    Plane.new
    return "Plane has left the airport"
  end

end


private
def full?
  @plane.count == @capacity
end
