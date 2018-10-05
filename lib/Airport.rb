class Airport
  @airportName = nil
  @airportId = nil
  @airportPlaneCapacity = nil
  @airportPassangerCapacity = nil
  @airportWeather = nil
    
  def initialize(airportName, airportId, airportPlaneCapacity, airportPassangerCapacity, airportWeather = "clear skies")
    @airportName = airportName
    @airportId = airportId
    @airportPlaneCapacity = airportPlaneCapacity
    @airportPassangerCapacity = airportPassangerCapacity
    @airportWeather = airportWeather
  end
  
#Setters
  def setAirportPlaneCapacity(capcity)
    @airportPlaneCapacity = capcity
  end
  
  def setAirportWeather(weather)
    @airportWeather = weather
  end
  
#Getters
  def getAirportId()
    @airportId
  end
  
  def getAirportName()
    @airportName
  end
  
  def getPlaneCapacity()
    @airportPlaneCapacity
  end
  
  def getPassangerCapacity()
    @airportPassangerCapacity
  end
  
  def getWeather()
    @airportWeather
  end
end