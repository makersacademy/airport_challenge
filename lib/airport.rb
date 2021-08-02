require_relative 'plane'

class Airport
  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail "Landing is not permmited- the airport is full" if full?
    
    @planes << plane
  end

  def take_off(*)
    @planes.pop
  end

  private

  def full?
    @planes.length >= DEFAULT_CAPACITY
  end 

end
