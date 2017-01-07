class AirTrafficControl

  def land_plane plane, airport
    airport.plane_landed plane if plane.land airport
  end

  def take_off_plane plane, airport
    airport.plane_taken_off plane if plane.take_off airport
  end

end
