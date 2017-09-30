class Airport
  attr_reader :parked_planes

  def initialize
    @parked_planes = []
  end
  
  def land plane
    @parked_planes << plane
  end
end
