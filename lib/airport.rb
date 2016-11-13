require './lib/plane.rb'


class Airport

  def initialize
    @landed_planes = []
  end

  def land(plane)
    @landed_planes << plane
  end
end
