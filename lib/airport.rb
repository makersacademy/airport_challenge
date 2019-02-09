class Airport

  attr_reader :hangar

  def land_plane(plane)
    @hangar = []
    @hangar.push(plane)
  end

  def takeoff_plane
    @hangar.pop
  end

end
