class Passanger
  @passangerName = nil
  @passangerLocation = nil
  @passangerDestination = nil
  @passangerPlane = nil
  def initialize(name)
    @passangerName = name
  end
  
  def setPassangerFlight(flight)
    @passangerLocation = flight.getFlightStartingLocation()
    @passangerDestination = flight.getFlightEndingDestination()
    @passangerPlane = @passangerFlight.getPlaneId()
  end
  
  def getPassangerFlight
    puts "Passanger #{@passangerName} is flying from: #{@passangerLocation} to: #{@passangerDestination} via: #{@passangerPlane}"
  end
end