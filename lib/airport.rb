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
    raise "The aeroplane has already landed" if @landed.include?(plane)
    raise "The aeroplane has already landed in another airport" unless plane.flying
    @landed << plane
    plane.flying=(false)
    plane
  end

  def departure(plane)
    raise "Stormy weather, red light for departure" if forecast == "stormy"
    raise "The aeroplane is not in the airport" unless @landed.include?(plane)
    @landed -= [plane]
    plane.flying=(true)
    plane
  end

  def full
    @landed.length >= @capacity
  end

end
