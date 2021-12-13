require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 30
  
  attr_accessor :capacity # accessor allows the system designer to override capacity as appropriate
  attr_reader :weather, :planes 
    
  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new) 
    @planes = [] # every new instance of airport will have a planes array that stores how many planes are currently landed
    @capacity = capacity  # every new instance of airport will have a default capacity of 30, unless the system designer overrides this by setting a different capacity. 
    @weather = weather 
    
  end

  def depart(plane)
    raise "It's stormy. Planes cannot depart at this time." if weather.stormy?
    raise "This plane is not in the airport!" unless @planes.include?(plane) # is this what instructions mean by "defending against edge cases"?
    @planes.delete(plane)
    @planes
  end

  def land(plane)
    raise "Airport is full! No planes can land here." if full?
    raise "It's stormy. Planes cannot land at this time." if weather.stormy?
    @planes << plane
  end

  private 

  def full?
    @planes.length >= capacity
  end

end