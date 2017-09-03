require_relative 'plane'

class Airport

  def initialize
    @planes = []

  end

  def land(plane)
    @planes << plane
  end

  def takeoff
    @planes.pop
  end

  def any_planes?
    @planes ||= []
  end

end
