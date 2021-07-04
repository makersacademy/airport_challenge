require_relative 'plane'

class Airport

  attr_reader :plane
  attr_reader :hangar

  DEFAULT_CAPACITY = 30

  def initialize
    @hangar = []
  end

  def land(plane)
    fail "Airport is full" if full?
    @hangar << plane
    @plane = plane
  end

  def take_off(plane) 
    @hangar.pop 
    @plane = plane
  end

  private

  def full?
    @hangar.count >= DEFAULT_CAPACITY
  end

end