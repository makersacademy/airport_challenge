class Airport
  attr_accessor :planes

  def initialize
    #An array to hold the planes that take off and land at the airport
    @planes=[]
  end
  #Method for a plane landing at an airport
  def lands_plane(plane)
    planes << plane
    "#{plane} has landed"
  end
  #Method for a plane landing at an airport
  def takes_off
    plane_take_off = planes.pop
    "#{plane_take_off} has taken off"
  end
end
