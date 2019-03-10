require "./lib/airport.rb"
class Plane

plane = Plane.new

attr_accessor :flight_number, :to, :from, :location, :weather

def land(flight_number, from, to)
  if accept_plane == true
  @flight_number = nil
  @location = to
  @from = nil
  else pass
  end
end

def take_off(flight_number, from, to)
  if accept_plane == true
  @location = "In the air"
  else pass
  end
end
end
