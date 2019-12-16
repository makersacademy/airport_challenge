require_relative 'plane'
require_relative 'weather'

class Airport
attr_reader :airport
attr_accessor :capacity

DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @airport = []
    @capacity = capacity
    @storm = true
  end
    
  def land(plane)
    fail "Error airport full." if full?
    @airport << plane
  end

  def take_off(plane)
    fail "Error weather too stormy" if stormy?

    @airport.delete(plane)
  end

  private

  def full?
    @airport.length >= @capacity
  end

  def stormy?
    rand(5) == 0 ? @stormy == true : @stormy == false
    return true if  @storm == true
  end
end
