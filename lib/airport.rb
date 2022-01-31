# require './lib/plane'

class Airport

  @planes_in_airport = []
  
  def initialise(capacity = 5)
    @capacity = capacity
  end
  
  def land(plane)
    plane
    # only land when not stormy
    # only land when airport not full
    # would need to push each plane into the planes_in_airport array
  end

  def takeoff(plane)
    "#{plane} has taken off"
    # only takeoff when not stormy
    # would need to remove(pop) each plane from the planes_in_airport array
  end

  # def full?
  #   @planes_in_airport.length > capacity
  # end 

end
