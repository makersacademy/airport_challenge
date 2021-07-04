require_relative 'plane'

class Airport
   
  attr_accessor :capacity

  DEFAULT_CAPACITY = 30

  def initialize(capacity = DEFAULT_CAPACITY )
    @capacity = capacity
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

 attr_reader :hangar

  def full?
    @hangar.length >= @capacity
  end

end