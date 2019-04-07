class Plane

  def confirm_take_off(airport)
    if airport.plane == self
      return false
    else
      return true
    end
  end

end
