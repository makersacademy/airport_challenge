require './lib/plane'

class Airport

attr_reader :plane

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
  end

end
