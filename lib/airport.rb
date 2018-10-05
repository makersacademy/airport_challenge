require_relative 'plane'
class Airport
  attr_reader :stored_planes

  def initialize
    @stored_planes = []
  end

  def receive_plane(plane)
    @stored_planes << plane
  end

  def release_plane(plane)
    @stored_planes.delete(plane)
  end

end
