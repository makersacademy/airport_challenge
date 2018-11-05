class AirTrafficController

  def ask_plane_to_land(aeroplane, airport, weather)
    return "Plane cannot land as airport is full!" if airport.full?
    return "Plane cannot land as weather is stormy!" if weather.stormy?
    airport.allow_landing(aeroplane)
  end

  def ask_plane_to_take_off(aeroplane, airport, weather)
    return "Plane cannot take off as weather is stormy!" if weather.stormy?
    airport.allow_take_off(aeroplane)
  end

  def confirm_plane_has_taken_off(aeroplane, airport)
    airport.plane_present?(aeroplane)
  end
end
