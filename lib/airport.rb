require './lib/plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
    planes[0]
  end

  def take_off(plane)
    @planes.pop
    p "airport now empty"
    planes[-1]
  end

end
