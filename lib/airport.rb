require_relative 'plane'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def lands(plane)
    @planes << plane
    @planes
  end

end
