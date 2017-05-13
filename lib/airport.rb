class Airport
  attr_accessor :planes, :capacity

  def initialize
    #An array to hold the planes that take off and land at the airport
    @planes=[]
    @capacity = 2
  end
  #Method for a plane landing at an airport
  def lands_plane(plane)
    raise 'There is no more space at the airport' if planes.length == capacity
    planes << plane
    "#{plane} has landed"
  end
  #Method for a plane landing at an airport
  def takes_off
    plane_take_off = planes.pop
    "#{plane_take_off} has taken off"
  end
end
