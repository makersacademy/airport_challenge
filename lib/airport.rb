
class Airport

attr_reader :plane

  def initialize
    @all_planes = []
    @weather
  end

  def land(plane)
    @all_planes << plane
  end

  def take_off
    @all_planes.pop
  end

end
