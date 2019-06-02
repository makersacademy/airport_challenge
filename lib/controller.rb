class Controller

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
