require_relative 'plane'

class Airport

  def initialize
    @planes = []
  end

  def land(plane)
    fail 'Airport full' if @planes.count >= 1
    @planes << plane
    true
  end

  def take_off(plane)
    true
  end

end
