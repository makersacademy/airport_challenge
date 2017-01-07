require_relative 'plane'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
    @planes[0]
  end

  def take_off(plane)
    @planes.pop
  end

end
