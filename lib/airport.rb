require_relative 'plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def landed_at(plane)
    @planes << plane
  end

  def departed(plane)
    @planes.delete(plane)
  end

end
