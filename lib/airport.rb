require './lib/plane'

class Airport

  def initialize
    @planes = []
  end

  def return_planes
    return @planes
  end

  def land(plane)
    @planes << plane
  end

  def take_off(plane)
    
  end
end