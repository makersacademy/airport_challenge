require_relative 'plane'

class Airport

  attr_accessor :hangar, :capacity
  DEFAULTCAPACITY = 10

  def initialize(capacity = DEFAULTCAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    fail "Airport is full" if full?

    @hangar << plane
  end

  def take_off(_plane)
    @hangar.pop
  end

  def full?
    @hangar.length >= @capacity
  end

  def override_capacity(number)
    @capacity = number
  end

end
