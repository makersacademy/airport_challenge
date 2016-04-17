require_relative 'airport.rb'

class Plane

  def request_takeoff(airport)
    fail "Plane is already flying" if airport.flying.include?(self) == true
    fail "Plane is not in airport" if airport.planes.include?(self) == false
    fail "Clearance denied" if airport.cleared_for_takeoff(self) == false
    self.takeoff(airport)
  end

  def request_land(airport)
    fail "Plane has already landed" if airport.check_plane_status(self) == "Plane in airport"
    fail "Clearance denied" if airport.cleared_for_landing(self) == false
    self.land(airport)
  end

  def takeoff(airport)
    airport.planes.delete(self)
    airport.flying << self
  end

  def land(airport)
    airport.planes << self
  end

end
