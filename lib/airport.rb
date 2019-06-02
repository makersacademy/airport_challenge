class Airport
  def initialize
    @planegroup = []
  end

  def land_plane(plane)
    raise "Sorry, the airport is full" if airport_full
    raise "Sorry, it is too stormy to land" if airport_stormy
  end
end
