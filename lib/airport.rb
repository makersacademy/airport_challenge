class Airport
  attr_reader :name, :planes

  def initialize(name = self)
    @name = name
    @planes = []
  end

  def request_landing(plane)
    @planes << plane
    plane.landed = true
  end

  def request_take_off(plane)
    @planes.delete(plane)
    plane.landed = false
  end
end
