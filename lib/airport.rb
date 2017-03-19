
class Airport
  attr_accessor :airplanes
  def initialize
    @airplanes = []
  end

  def land(plane)
    if landed?(plane) == true
      raise "Plane already in airport."
    else
    plane.status_land #Not tested
  @airplanes << plane #Not tested
  end
end

 def takeoff(plane)
   if landed?(plane) == false
     raise "Plane cannot takeoff if not landed in airport."
   else
  plane.status_takeoff #Not tested
  @airplanes.delete(plane) #Not tested
end
 end

  def landed?(plane)
    if @airplanes.include? plane
      true
    else
      false
    end
  end
  end
