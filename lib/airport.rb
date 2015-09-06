class Airport

  attr_reader :planes
  attr_reader :capacity

  def initialize (capacity = 10)
    @planes = []
    @capacity = capacity
    @weather = 'not stormy'
  end

  def plane_take_off
    traffic_control
    planes[0].take_off
    planes.shift
  end

  def plane_landing (plane)
    traffic_control
    fail "The airport is full" if planes.count >= capacity
    plane.land
    planes << plane
  end

  def traffic_control
    fail "The weather is stormy!" if weather_check == 'stormy'
  end

  def weather_check
    rand()<0.2 ? 'stormy' : 'not stormy'
  end

end
