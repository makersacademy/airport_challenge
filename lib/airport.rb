class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land plane
    plane.land_at(self)
    @planes << plane
  end


end
