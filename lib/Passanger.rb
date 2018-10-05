class Passanger
  @passangerName = nil
  @passangerDestination = nil
  @passangerFlight = nil
  def initialize(name, destination, flightId)
    @passangerName = name
    @passangerDestination = destination
    @passangerFlight = flightId
  end
end