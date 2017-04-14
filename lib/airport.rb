class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
  end

  def take_off
    raise RuntimeError, "There are no planes" if @planes.empty?
    @planes
  end
end
