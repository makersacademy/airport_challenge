class Flight
  @flightId = nil
  @flightPlaneId = nil
  @flightDestination = nil
  @flightStartingLocation = nil
  @flightStatus = nil
  def initialize(plane)
    @flightPlaneId = plane.getId()
    @flightDestination = plane.getDesination()
    @flightStartingLocation = plane.getLocation()
    @flightStatus = plane.getStatus()
  end
end
    