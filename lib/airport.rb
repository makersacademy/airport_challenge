require_relative 'plane'

class Airport

  def initialize
    @planes = []
  end

  #encapsulated planes array
  def planes
    @planes.dup
  end

  def land(plane)
    @planes << plane
  end

  def takeoff
    @planes.shift
  end

end
