class Plane
  attr_accessor :origin, :destination, :in_flight

  def initialize
    @origin = Airport.new
    @destination = Airport.new
    @in_flight = false
  end 

  def location
    if in_flight == false
      origin
    else
      response = "Tower, this is #{self}, we are en route to #{destination} out of #{origin}, out."
    end
  end

  def takeoff(airport_origin)
    if airport_origin.safe_to_takeoff?
      airport_origin.gates -= [self]
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
