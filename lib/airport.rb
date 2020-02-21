require_relative 'plane'

class Airport

  attr_reader :plane


# def initialize
#   @airport = []
  #
  def land
    Plane.new
  end


  def store(plane)
    @plane = plane
  end
  #
  # def plane
  #   @plane
  # end



  def take_off
    Plane.new
    return "Plane has left the airport"
  end

end
