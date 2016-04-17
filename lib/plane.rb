require_relative 'airport.rb'

class Plane

  def request_takeoff(airport)
    #airport.cleared_for_takeoff(self)
    fail "Clearance denied" if airport.cleared_for_takeoff(self) == false
    self.takeoff(airport)
  end

  def request_land(airport)
  #  airport.cleared_for_landing(self)
    fail "Clearance denied" if airport.cleared_for_landing(self) == false
    self.land(airport)
  end

  def takeoff(airport)
    airport.planes.delete(self)
  end

  def land(airport)
    airport.planes << self
  end

end
