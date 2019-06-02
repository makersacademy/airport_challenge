class Controller

  def land_plane?(airport, weather)
    if airport.full? || weather.stormy?
      false
    else
      true
    end
  end

end
