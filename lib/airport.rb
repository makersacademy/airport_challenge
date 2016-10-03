class Airport
  def initialize
    @planes =[]
  end
  def lands_plane(plane)
    @planes << plane
  end

  def takeoff_plane
    @planes.pop
  end
end
