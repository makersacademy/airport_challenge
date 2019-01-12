class Airport

  def initialize(capacity=20)
    @capacity = capacity
    @planes = []
  end

  def full?
    @planes.length >= @capacity
  end

  def land(plane)
    raise 'Unable to land: airport full' if full?
    @planes.push(plane)
  end

  def takeoff(plane)
    return false unless @planes.include?(plane)
    @planes.delete(plane)
  end
end

