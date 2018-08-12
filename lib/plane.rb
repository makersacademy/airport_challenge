require_relative "./airport.rb"

class Plane

  def land(airport, weather)
    fail "bad weather: can't land" unless weather == true
    airport.hanger << self
  end

  def take_off(airport, weather)
    fail "bad weather: can't take-off" unless weather == true
    fail "no planes in hanger" if airport.hanger == []
    "The plane is no longer at #{airport}"
    airport.hanger -= [self]
    #need test for this print out
  end

end
