
class Airport

  def initialize(capacity)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'Airport is full, cannot land' if @planes.length >= @capacity
    @planes << plane
  end

  def take_off(plane)
  end
end
