require_relative "plane"
require_relative "weather"

class Airport

  DEFAULT_CAPACITY = 20

  include Weather

  attr_reader :planes
  attr_accessor :capacity
    
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end    

  def landing(plane, airport)

    raise "Plane cannot land as weather is stormy" if stormy?

    raise "Plane cannot land as it is already at this airport" if at_airport?(plane, airport) 

    raise "Plane cannot land as it is not flying" if plane.flying == false 

    @planes.push(plane)  

    plane.flying = false 

  end

  def take_off(plane, airport)

    raise "Plane cannot take off as weather is stormy" if stormy?

    raise "Plane cannot take off as not at airport" unless at_airport?(plane, airport)

    @planes.delete(plane)
    
    plane.flying = true

  end

  # Using length rather than count as google suggests best practice

  def full? 
    raise "Cannot land as airport is full" if @planes.length >= @capacity
  end

  private
  
  def at_airport?(plane, airport) 
    airport.planes.include?(plane)
  end

end
