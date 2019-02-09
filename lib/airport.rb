class Airport
  attr_reader :planes

  def initialize()
    @planes = []
  end

  def add_plane(plane)
    planes << plane
  end

  def delete_plane(plane)
    planes.delete(plane)
  end

end
