
class Airport

  def initialize
    @plane = Plane.new
    @planes = []
  end

  def land
    @plane
  end

  def take_off
    @plane
    # @planes.delete(@plane)
  end
end
