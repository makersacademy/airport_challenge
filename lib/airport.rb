class Airport
  attr_reader :planes
  def initialize
    @planes = []
  end

  def plane_lands(plane = '')
    @planes << plane
  end

  def plane_takes_off(*)
    @planes.pop
  end
end
