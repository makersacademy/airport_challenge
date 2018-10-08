class Flight
  @flightId = nil
  @flightPlaneId = nil
  @flightEndingDestination = nil
  @flightStartingLocation = nil
  @flightStatus = nil
  $count = 0
  def initialize(plane)
    @flightPlaneId = plane.getPlaneId()
    @flightEndingDestination = plane.getPlaneDestination()
    @flightStartingLocation = plane.getPlaneLocation()
    @flightStatus = plane.getPlaneStatus()
    @flightId = $count
    $count += 1
  end
  
  def getFlightId()
    @flightId
  end
  
  def getFlightStartingLocation()
    @flightStartingLocation
  end
  
  def getFlightEndingDestination()
    @flightEndingDestination
  end
end
    