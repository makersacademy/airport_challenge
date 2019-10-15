# /lib/airport

class Airport
  
  def initialize
    @planes = []
    @capacity = 1
    @weather = Weather.new
  end

  def land(plane)
    @planes << plane
    plane.arrive
  end

  def takeoff(plane)

  end

end
