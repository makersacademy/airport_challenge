require_relative './weather.rb'
require_relative './plane.rb'

class Airport

  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def plane_land(plane, weather)
    fail 'Landing prevented due to storm' if weather.stormy?
    fail 'Airport is full' if full?

    @planes << plane
  end

  def plane_depart(plane, weather)
    fail 'Takeoff prevented due to storm' if weather.stormy?
    fail 'Plane no longer here' if plane_status?(plane) == false
  
    @planes.delete(plane)
  end

  private

  def plane_status?(plane)
    @planes.include?(plane)
  end

  def full?
    @planes.count >= @capacity
  end

end
