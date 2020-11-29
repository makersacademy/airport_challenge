require_relative './airport.rb'

class Plane

  def land(airport)
    fail "This airport is full!" if airport.full?
    fail "The weather is too stormy!" if airport.stormy?
    airport.hangar << self
    "Landed!"
  end

  def take_off(airport)
    fail "The weather is too stormy!" if airport.stormy?
    "Taken off!"
  end

end