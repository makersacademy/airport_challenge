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

  def handle_take_off_request(plane, airport, weather)

    if !plane.at_airport?
      "Plane did not take off due to not being at the airport."
    elsif take_off?(weather)
      plane.take_off
      airport.remove_plane
      "Plane has taken off."
    else
      "Plane did not take off due to stormy weather."
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
