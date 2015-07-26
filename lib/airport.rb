require_relative 'plane'
class Airport
  def initialize
    @planes = []
  end

  def take_off
    fail 'Plane is already flying' if landed_planes.empty?
    @planes.pop
  end

  def dock plane
    @planes << plane
  end

private
attr_reader :planes

def landed_planes
  @planes.reject { | plane | plane.flying?}
end

end
