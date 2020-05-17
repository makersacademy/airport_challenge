require_relative 'plane'

class Airport
  def initialize
    @planes = []
  end

  def land(plane)
    @planes.push(plane)
  end

  def take_off(plane)
    @planes - [plane]
  end
end