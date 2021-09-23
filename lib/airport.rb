class Airport
  def initialize
    @planes = []
  end

  attr_reader :planes

  def land(plane)
    @planes << plane
  end


end