require_relative 'plane'

class Airport

  attr :planes

  def initalize
    @planes = []
  end

  def land(plane)
    @planes = plane
  end

end