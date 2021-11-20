require_relative './plane'
require_relative './weather'

class Airport
include Weather
  attr_reader :landed
  attr_reader :capacity
  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @landed = []
    @capacity = capacity
  end
  
  def land(plane)
    raise "Stormy weather, red light for landing" if forecast == "stormy" 
    raise "The airport is full, redirecting somewhere else" if full
    @landed << plane
    plane
  end

  def departure
    raise "Stormy weather, red light for departure" if forecast == "stormy"
    @landed.shift
  end

  def full
    @landed.length < @capacity ? false : true
  end

end