class Airport
  attr_accessor :planes

  def initialize
    @planes = []
  end

  def land_plane(plane)
    @planes << plane
  end

  def take_off(plane)
    fail "That plane doesn't exist!" unless @planes.include?(plane)
    @planes.delete(plane)
  end
end
