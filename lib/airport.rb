
class Airport

  def initialize(capacity)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'Airport is full, cannot land' if @planes.length >= @capacity
    raise 'Weather is stormy cannot land a plane' if stormy?
    @planes << plane
  end

  def take_off(plane)
    raise 'Weather is stormy planes cannot take off' if stormy?
    raise 'Plane is not at this airport' unless @planes.include?(plane)
    plane
  end

  def stormy?
    rand(1..6) > 4
  end
end
