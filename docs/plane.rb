class Plane

  attr_accessor :location

  def initialize(location = nil)
    @location = location
  end 

  def land(airport)
    @location = airport
  end

  def takeoff(airport)
  end 

  def flying
  end 
  
end 