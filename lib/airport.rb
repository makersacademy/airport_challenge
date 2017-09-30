class Airport

  def initialize
    @plane
  end

  def accept_plane(plane)
    @plane = plane
  end

  def release_plane(plane)
    @plane = nil
  end

end
