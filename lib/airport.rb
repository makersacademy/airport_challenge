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
end
