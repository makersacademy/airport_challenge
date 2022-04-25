class Plane
  attr_accessor :plane

  def initialize
    @airbourne = true
  end

  def land(airport)
    if airport.planes.include?(self)
      raise 'Plane has already landed'
    elsif airport.planes.count == airport.capacity
      raise 'Cannot land, airport is at capacity'
    else 
      @airbourne = false
      airport.planes << self
    end 
  end

  def takeoff(airport)
    if @airbourne == true
      raise 'Plane already airbourne'
    elsif airport.planes.include?(self) == false
      raise 'Plane not in airport'
    else 
      @airbourne = true 
      airport.planes.delete(self)
    end 
  end
end 