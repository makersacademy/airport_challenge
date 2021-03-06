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
      origin.code
    else
      "Tower, this is #{callsign}, we are en route 
       to #{destination.code} out of #{origin.code}, out."
    end
  end

  def takeoff(airport_destination)
    raise "This callsign is already in flight" unless takeoff_condition
    origin.gates -= [self]
    @destination = airport_destination
    @in_flight = true
    :success 
  end

  def takeoff_condition
    origin.safe_to_takeoff? && @in_flight == false
  end

  def land(airport_destination)
    return unless airport_destination.safe_to_land?

    airport_destination.gates << self
    @in_flight = false
    :success
  end
end
