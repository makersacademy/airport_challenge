class Plane
  @planeCompany = nil
  @planeCurrentCapacity = nil
  @planeTotalCapacity = nil
  @planeLocation = nil
  @planeDestination = nil
  @planeId = nil
  @planeStatus = nil
  def initialize(planeCompany, planeTotalCapacity, planeLocation, planeDestination, planeId, planeStatus = "Loading", planeCurrentCapacity = planeTotalCapacity)
    @planeCompany = planeCompany
    @planeTotalCapacity = planeTotalCapacity
    @planeLocation = planeLocation
    @planeDestination = planeDestination
    @planeId = planeId
  end
  
  def land()
    @planeLocation = @planeDestination
    @planeStatus = "Landed at #{@planeLocation.getAirportName()}"
  end
  
  def takeOff()
    @planeLocation = "In Transit to #{@planeDestination}"
    @planeStatus = "In Transit to #{@planeDestination}"
  end
  
#Setters
  def setPlaneLocation(location)
    @planeLocation = location
  end
  
  def setPlaneDestination(destination)
    @planeDestination = destination
  end
  
  def setPlaneStatus(status)
    @planeStatus = status
  end
  
  def setPlaneCurrentCapacity(capacity)
    @planeCurrentCapacity = capacity
  end
  
#Getters
  def getPlaneId()
    @planeId
  end
  
  def getPlaneStatus()
    @planeStatus
  end
  
  def getPlaneLocation()
    @planeLocation
  end
  
  def getPlaneDestination()
    @planeDestination
  end
end