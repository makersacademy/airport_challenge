require_relative 'plane'


class Airport
    attr_reader :landed_planes

  def initialize
    @landed_planes = []
  end

  def store_plane(plane)
    @landed_planes.push(plane)
  end

  def release_plane(plane)
    index_of_plane = @landed_planes.index(plane)
    @landed_planes.delete_at(index_of_plane)
  end
end
