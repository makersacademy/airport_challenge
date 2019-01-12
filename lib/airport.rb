require_relative 'plane'

class Airport

  attr_accessor :hangar, :capacity


  def initialize(capacity = default_capacity)
    @hangar = []
    @capacity = capacity
  end

  def default_capacity
    10
  end

  def land(plane, n = rand(4))
    fail "Weather is too stormy." if stormy?(n)
    fail "Hangar is at capacity" if full?
    hangar << plane
  end

  def take_off(n = rand(4))
    fail "Weather is too stormy." if stormy?(n)
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
