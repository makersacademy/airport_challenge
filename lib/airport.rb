class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def recieve_plane(plane)
    @planes << plane
  end

  def release_plane
    @planes.pop
  end
end
