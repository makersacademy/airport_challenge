require_relative 'plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def has_landed(plane)
    @planes << plane
  end

  def departed(plane)
    @planes.delete(plane)
  end

end
