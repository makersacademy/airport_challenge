class Airport

  def initialize(capacity)
    @capacity = capacity
  end
  def land(plane)
    raise 'Cannot land: airport full' if @planes >= @capacity
  end
  def take_off(plane)
  end
end