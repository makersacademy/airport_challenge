class Plane
  attr_reader :flying
  def initialize
    @flying = true
  end

  def land(airport)
    if airport.full?
      fail "airport is full" 
    elsif airport.is_stormy?
      fail "weather is stormy"
    elsif self.flying? == false
      fail "plane has already landed"
    end
    airport.planes.push(self)
    @flying = false
  end

  def depart(airport)
    if airport.is_stormy?
      fail "weather is stormy"
    elsif airport.planes.include?(self) == false
      fail "plane is not at that airport"
    elsif self.flying? 
      fail "plane is already flying"
    end
    airport.planes.delete(self)
    @flying = true
  end

  def flying?
    @flying
  end
end