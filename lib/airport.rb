require_relative './plane'
require_relative './weather'

class Airport
include Weather
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
    raise "Stormy weather, red light for landing" if forecast == "stormy" 
    @landed << plane
  end

  def departure
    raise "Stormy weather, red light for departure" if forecast == "stormy"
    @landed.shift
  end

end