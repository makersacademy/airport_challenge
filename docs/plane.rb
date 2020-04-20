class Plane

  attr_accessor :location

  def initialize(location = nil)
    @location = location
  end 

  def land(airport)
    @location = airport
  end

  def takeoff(airport)
    @location = "sky"
  end 

  def flying?
    @location == "sky"
  end 
  
end 