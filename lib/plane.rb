class Plane

  def land(airport)
    airport.store_plane(self)
  end

  def take_off(airport)
  end

  def confirm_landed?
    true
  end

  def confirm_take_off?
    true
  end

end
