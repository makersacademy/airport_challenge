class Plane
  attr_accessor :origin, :destination
  attr_reader :in_flight, :callsign

  def initialize(callsign = self, origin = Airport.new, destination = Airport.new)
    @origin = origin
    @origin.gates << self
    @destination = destination
    @in_flight = false
    @callsign = callsign.to_s
  end 

  def location
    if in_flight == false
      origin.code
    else
      "Tower, this is #{callsign}, en route to #{destination.code} out of #{origin.code}, out."
    end
  end

  def takeoff(airport_destination)
    raise "This callsign is already in flight" unless @in_flight == false

    raise "The weather prevents take off" unless origin.safe_to_manoeuvre?
    
    origin.gates -= [self]
    @destination = airport_destination
    @in_flight = true
  end

  def land(airport_destination)
    raise "This callsign has already landed" unless @in_flight == true

    raise "The weather prevents landing" unless airport_destination.safe_to_manoeuvre?

    raise "The airport is at capacity, enter the holding circuit" unless !airport_destination.at_capacity?
    
    airport_destination.gates << self
    @origin = airport_destination
    @in_flight = false
  end
end
