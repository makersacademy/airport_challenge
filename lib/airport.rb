class Airport
  attr_accessor :capacity
  attr_accessor :landed_planes

  def initialize
    @capacity = 20
    @landed_planes = []
  end

  def land(plane)
    raise 'Plane cannot land because it is stormy' if stormy?

    @landed_planes << plane
  end

  def take_off(plane)
    raise 'Plane cannot take off because it is stormy' if stormy?

    @landed_planes.delete(plane)
  end

  def stormy?
    random_generator = rand(1..10)
    p random_generator > 7
  end
end
