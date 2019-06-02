class Controller

  def handle_landing_request(plane, airport, weather)
    if land_plane?(airport, weather)
      plane.land
      airport.add_plane
      true
    else
      false
    end
  end
  
  def land_plane?(airport, weather)
    if airport.full? || weather.stormy?
      false
    else
      true
    end
  end

  def take_off?(weather)
    if weather.stormy?
      false
    else
      true
    end
  end

end
