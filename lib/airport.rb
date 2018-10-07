class Airport
  attr_reader :planes
  NOT_IN_THIS_AIRPORT = 'Plane is not in this airport'
  ALREADY_AT_THIS_AIRPORT = 'Plane is already at an airport!'

  def initialize
    @planes = []
  end

  def add_plane(plane)
    fail ALREADY_AT_THIS_AIRPORT if plane?(plane)
    @planes << plane
    plane
  end

  def remove_plane(plane)
    fail NOT_IN_THIS_AIRPORT unless plane?(plane)
    @planes.delete(plane)
  end

  def plane?(plane)
    @planes.include?(plane)
  end

end
