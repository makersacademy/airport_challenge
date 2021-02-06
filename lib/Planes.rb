class Plane

end


class Airport
  attr_reader :plane, :capacity
  MAX_AIRPORT_CAPACITY = 20
  def initialize(capacity = MAX_AIRPORT_CAPACITY)
    @capacity = capacity
    @plane = []
  end

  def land(plane)
    if @plane.length >= @capacity
      fail 'Airport is full'
    else
      @plane << plane
    end
  end 
  
  def take_off
      @plane.pop
  end
  
end