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
    if plane.flying
      @landed << plane
      plane.flying=(false)
      plane
    elsif @landed.include?(plane)
      raise "The aeroplane has already landed"
    else
      raise "The aeroplane has already landed in another airport"
    end
  end

  def departure(plane)
    raise "Stormy weather, red light for departure" if forecast == "stormy"
    if @landed.include?(plane)
      @landed -= [plane]
      plane.flying=(true)
      plane
    else
      raise "The aeroplane is not in the airport"
    end
  end

  def full
    @landed.length < @capacity ? false : true
  end

end