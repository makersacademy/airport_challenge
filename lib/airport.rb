class Airport
  attr_reader :planes
  def initialize
    @planes = []
  end

  def land plane
    planes << plane
    plane.land
  end

  def take_off plane
    plane.take_off
  end
end
