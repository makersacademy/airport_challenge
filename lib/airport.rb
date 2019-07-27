require_relative 'plane'

class Airport
  def initialize
    @planes = []
  end

  attr_reader :planes

  def land(plane)
    @planes << plane
  end

  def take_off(plane)
    @planes.delete(plane)
  end

end