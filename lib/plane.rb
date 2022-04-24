class Plane
  attr_accessor :plane
  
  def land(airport)
    if airport.planes.include?(self)
      raise 'Plane has already landed'
    else  
      airport.planes << self
    end 
  end

  def takeoff(airport)
    airport.planes.delete(self)
  end
end 