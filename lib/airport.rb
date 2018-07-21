
class Airport
  def initialize(capacity)
    @capacity = capacity
    @no_of_planes_landed = 0
    
  end
  def land(plane)
    raise "cannot land plane, airport has reached capacity" if @no_of_planes_landed >= @capacity
    @no_of_planes_landed += 1
    
  end

  def take_off(plane)
    
  end

  
end
