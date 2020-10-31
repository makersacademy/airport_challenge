require_relative 'plane'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    raise "Airport full! You cannot land here!" if @planes.count >= 20

    @planes << plane
  end

  def takeoff(plane)
    @planes -= [plane]
  end
end
