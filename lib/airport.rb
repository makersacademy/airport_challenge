
class Airport

 attr_reader :landed_planes

  def initialize
    @landed_planes = []
  end

  def land(plane)
    @plane = plane
    @landed_planes << plane
  end

  def take_off(plane)
    plane
  end

  # def landed_planes
  #  @plane
  # end
end
