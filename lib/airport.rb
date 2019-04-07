require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 10

   attr_accessor :capacity
   attr_accessor :weather
   attr_accessor :planes


  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    if full?
      "Airport full"
    else
    @planes << plane
    'Plane landed'
    end
  end

  def delete(*)
    @planes.pop
    "Plane is no longer in airport"
  end

  def empty?
    @planes.empty?
  end

  def full?
    @planes.count == @capacity
  end

  def control_landing(plane)
    airport = Airport.new
    return "It is too stormy to land" if weather == "Stormy"
    return "Airport full" if full?

    airport.land(plane)
    end

  def control_takeoff(plane)
    airport = Airport.new
    return "It is too stormy to take off" if weather == "Stormy"
    return "The airport is empty" if empty?

    airport.delete(plane)
  end
  
  def weather
     Weather.new
  end

end
