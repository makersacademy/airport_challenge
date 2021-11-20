require_relative './plane'

class Airport
  attr_reader :landed
  attr_reader :capacity
  attr_accessor :full
  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @full = false
    @landed = []
    @capacity = capacity
  end
  
  def land(plane)
    raise "The airport is full, redirecting somewhere else" if full 
    @landed << plane
  end

  def departure
    @landed.shift
  end

end