require_relative 'plane'

class Airport

  attr_accessor :hangar, :capacity
  @DEFAULT_CAPACITY = 10

  def initialize(capacity = @DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    fail "Weather is too stormy." if plane.is_a?(Plane) && stormy?(rand(4))
    fail "Hangar is at capacity" if full?
    hangar << plane
  end

  def take_off
    fail "Weather is too stormy." if hangar.last.is_a?(Plane) && stormy?(rand(4))
    hangar.pop
  end

  def stormy?(n)
    if n == 2
      true
    end
  end

  def full?
    true if hangar.length == @capacity
  end

end
