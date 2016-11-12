require_relative 'plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
    "Flight #{plane} has landed."
  end

  def take_off
    @planes.pop
  end

end
