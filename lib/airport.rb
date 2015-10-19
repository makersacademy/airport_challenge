class Airport
  DEFAULT_CAPACITY = 25

  def initialize
    @planes = []
  end

  def land(plane)
    fail 'Plane can\'t land. Airport is full!' if full?
    fail 'Plane can\'t land. Weather is stormy!' if stormy?
    @planes << plane
  end

  def take_off(plane)
    fail 'Plane can\'t take off. Weather is stormy!' if stormy?
    fail 'Plane can\'t take off. Wrong airport!' unless wrong_airport?(plane)
    @planes.pop
  end

  private

  def full?
    @planes.length >= DEFAULT_CAPACITY
  end

  def stormy?
    rand(0..100) > 95
  end

  def wrong_airport?(plane)
    @planes.include?(plane)
  end
end