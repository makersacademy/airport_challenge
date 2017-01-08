#handles messages between airport and planes
class AirTrafficControl

  def land_plane plane, airport
    return false if airport.full? || airport.stormy?
    return false if plane.landed?
    plane.land airport
    airport.plane_landed plane
    true
  end

  def take_off_plane plane, airport
    return false if airport.stormy?
    return false unless plane.landed?
    plane.take_off airport
    airport.plane_taken_off plane
    true
  end

end
