
class Airport
  def initialize(capacity)
    @capacity = capacity
    # @no_of_planes_landed = 0
    @planes = []
  end
  def land(plane)
    raise "cannot land plane, airport has reached capacity" if full?
    # @no_of_planes_landed += 1
    @planes << plane 
  end

  def take_off(plane)
  
  end

  def full?
    @planes.length >= @capacity
  end
end
