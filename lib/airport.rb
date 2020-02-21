require_relative 'plane'

class Airport


# def initialize
#   @airport = []
  #
  def land
    Plane.new
  end


  def store(plane)
    plane
  end
  #
  def plane
  end



  def take_off
    Plane.new
    return "Plane has left the airport"
  end

end
