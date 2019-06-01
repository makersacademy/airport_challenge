class Controller
  def land_plane?(airport,weather)
    if airport.is_full? || weather.is_stormy?
      false
    else
      true
    end
  end
end