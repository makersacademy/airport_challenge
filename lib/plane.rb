class Plane
  attr_accessor :origin, :destination, :in_flight

  def initialize
    @origin = Airport.new
    @destination = Airport.new
    @in_flight = false
  end 

  def location
    "location"
  end

  def takeoff(airport)
    if airport.safe_to_takeoff?
      airport.gates -= [self]
      :success
    end
  end

  def land(airport)
    if airport.safe_to_land?
      airport.gates << self
      :success
    end
  end
end
