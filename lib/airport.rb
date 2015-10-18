class Airport
  def initialize
    @planes = []
  end

  def land(plane)
    fail 'Plane can\'t land. Airport is full!' if @planes.length >= 25
    @planes << plane
  end

  def take_off(plane)

  end

end