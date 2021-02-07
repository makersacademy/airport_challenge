require_relative 'plane'
class Airport

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
    @planes
  end

end
