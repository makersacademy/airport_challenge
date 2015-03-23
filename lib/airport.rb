require_relative 'plane'

class Airport
  def initialize
    @planes = [] #this is the container
  end

  def planes
    @planes
  end

  def land(plane)
    @planes << plane
  end

end
