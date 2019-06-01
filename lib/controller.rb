class Controller
  def land_plane?(airport)
    if airport.is_full?
      false
    else
      true
    end
  end
end