require_relative 'plane'

class Airport

  attr_accessor :hangar
  DEFAULTCAPACITY = 10

  def initialize
    @hangar = []
  end

  def land(plane)
    fail "Airport is full" if full?

    hangar << plane
  end

  def take_off(_plane)
    hangar.pop
  end

  def full?
    hangar.length >= DEFAULTCAPACITY
  end
end
