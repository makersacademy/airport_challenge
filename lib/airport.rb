class Airport
  def initialize(capacity)
  @capacity = capacity
  @planes = []
  end

  def land(plane)
    raise 'Airport is full' if @planes.length >= @capacity
    raise 'Weather is storming can not land' if stormy?
    @planes << plane
  end

  def take_off(plane)
  end

  def stormy?
    rand(1..6) > 4
  end
end