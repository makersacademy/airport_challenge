require './lib/plane'

class Airport

  attr_reader :plane

  def initialize
    @planes = []
  end

  def land_at_airport(plane)

    @planes << @plane
    @plane = plane
  end

end
