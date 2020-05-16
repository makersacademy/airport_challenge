require_relative 'plane'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def recieve_plane(plane)
    planes << plane
  end

  def take_off_plane(plane)
    planes.delete(plane)
  end
end
