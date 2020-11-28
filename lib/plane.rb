require_relative './airport.rb'

class Plane

  def land(airport)
    fail "This airport is full!" if airport.full?
    airport.hangar << self
    "Landed!"
  end

  def take_off
    "Taken off!"
  end

end