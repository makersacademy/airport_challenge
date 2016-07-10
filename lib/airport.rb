require_relative 'plane'
require_relative 'weather'

class Airport

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
    @planes.last
  end

  def take_off
    fail "airport experiencing stormy weather" unless Weather.clear?
    @planes.pop
  end

end
