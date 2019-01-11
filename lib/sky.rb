class Sky

  attr_reader :flying_planes

  def initialize
    @flying_planes = []
  end

  def add_plane(plane)
    @flying_planes << plane
    self
  end

end
