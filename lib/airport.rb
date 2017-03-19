
class Airport
  attr_accessor :airplanes
  def initialize
    @airplanes = []
  end

  def land(plane)
    plane.status_land #Not tested
  @airplanes << plane #Not tested
  end

 def takeoff(plane)
  plane.status_takeoff #Not tested
  @airplanes.delete(plane) #Not tested
 end

  def landed?(plane)
    if @airplanes.include? plane
      true
    else
      false
    end
  end
  end
