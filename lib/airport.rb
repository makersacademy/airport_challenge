require_relative 'plane'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def receive_plane(plane)
    @planes << plane
  end

end
