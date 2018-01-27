class Airport
  def initialize
    @hangar = []
  end

  def land_plane(plane)
    @hangar << plane
  end

  def take_off_plane(plane)
    @hangar.delete(plane)
  end
end
