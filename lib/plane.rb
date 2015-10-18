class Plane
  attr_reader :in_flight, :location

  def initialize
    @in_flight = false
    @location = 'factory'
  end

  def lands
    fail "The plane is already on the ground" if !in_flight
    fail "Only Airports can tell Planes to land" if location == 'in transit'
    @in_flight = false
  end

  def takes_off
    fail "The plane is already flying" if in_flight
    fail "Only Airports can tell Planes to take off" if location != 'in transit'
    @in_flight = true
  end

  def update_location(new_location)
    @location = new_location
  end

end
