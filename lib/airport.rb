class Airport
  def initialize
    @hangar = []
  end
  def land_plane(plane)
    @hangar << plane
  end
  def takeoff_plane(plane)
    @hangar.delete(plane)
  end
end
