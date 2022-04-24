class Plane
  attr_accessor :plane
  
  def land(airport)
    if airport.planes.include?(self)
      raise 'Plane has already landed'
    elsif airport.planes.count == airport.capacity
      raise 'Cannot land, airport is at capacity'
    else airport.planes << self
    end 
  end

  def takeoff(airport)
    airport.planes.delete(self)
  end
end 