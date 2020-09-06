class Plane
  attr_accessor :location
  attr_accessor :last_airport

  def initialize
    @location = "in the air"
    @last_airport = "none"
  end

  def land(airport)
    fail "Can't land if not in the air." if @location != "in the air"
    fail "The hangar is full." if airport.full?
    airport.add_plane
    @location = airport
  end

  def take_off(airport)
    fail "The plane is not at this airport" if airport != @location
    @last_airport = airport
    @location = "in the air"
    location?
  end

  def location?
    return "The plane is #{@location}."
  end

end