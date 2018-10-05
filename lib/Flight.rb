class Flight
  @flightId = nil
  @flightPlaneId = nil
  @flightDestination = nil
  @flightStartingLocation = nil
  @flightStatus = nil
  $count = 0
  def initialize(plane)
    @flightPlaneId = plane.getPlaneId()
    @flightDestination = plane.getPlaneDestination()
    @flightStartingLocation = plane.getPlaneLocation()
    @flightStatus = plane.getPlaneStatus()
    @flightId = $count
    $count += 1
  end
  
  def getFlightId()
    @flightId
  end
end
    