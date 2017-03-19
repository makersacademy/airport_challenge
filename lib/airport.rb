require_relative 'plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def take_off
    planes.pop
  end

  def land(plane)
    planes << plane
  end
end
