class Plane
  attr_accessor :origin, :destination
  attr_reader :in_flight, :callsign

  def initialize(callsign = self, origin = Airport.new, destination = Airport.new)
    @origin = origin
    @destination = destination
    @in_flight = false
    @callsign = callsign.to_s
  end 

  def location
    if in_flight == false
      origin
    else
      response = "Tower, this is #{self}, we are en route to #{destination} out of #{origin}, out."
    end
  end

  def takeoff(airport_destination)
    if origin.safe_to_takeoff?
      origin.gates -= [self]
      @destination = airport_destination
      @in_flight = true
      :success
    end
  end

  def land(airport_destination)
    if airport_destination.safe_to_land?
      airport_destination.gates << self
      @in_flight = false
      :success
    end
  end
end
