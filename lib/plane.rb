require_relative('./airport')

class Plane
  def land_at_airport(airport)
    fail "The airport is full" if airport.full?
    fail "It's too stormy to land" if airport.local_weather == "Stormy"
    @in_airport = true
    airport.parked_planes << self
  end

  def take_off_from_airport(airport)
    fail "The plane is not parked in that airport" unless airport.parked_planes.include?(self)
    fail "It's too stormy to take off" if airport.local_weather == "Stormy"
    airport.parked_planes.delete(self)
    @in_airport = false
  end

  def in_airport?
    @in_airport
  end 

end 
