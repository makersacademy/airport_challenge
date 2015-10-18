class Airport
  def initialize
    @planes = []
  end

  def land(plane)
    fail 'Plane can\'t land. Airport is full!' if full?
    @planes << plane
  end

  def take_off(plane)

  end

  private

  def full?
    @planes.length >= 25
  end

end