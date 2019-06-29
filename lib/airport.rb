require_relative 'plane'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    planes << plane
  end

  def takeoff(plane)
    planes.pop
  end

  def confirm(plane)
    planes.count
  end
end
