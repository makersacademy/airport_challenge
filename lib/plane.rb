require_relative './airport.rb'

class Plane

  def land(airport)
    airport.hangar << self
    "Landed!"
  end

  def take_off
    "Taken off!"
  end

end