require_relative 'plane'

class Airport
  def initialize
    @hanger = []
  end

  def land(plane)
    plane  
  end

  def store(plane)
    @hanger << plane 
  end

  def take_off(_plane)
    "Plane takes off!"
  end

  def left_airport(plane)
    @hanger.delete(plane)
  end

end
