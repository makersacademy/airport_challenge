
class Plane
  def take_off_from(airport, weather)
    check_if_already_flying
    airport.release(self, weather)
    @flying = true
     'The plane has taken off'
  end

  def land_at(airport, weather)
    check_if_already_landed
    airport.dock(self, weather)
    @flying = false
    'The plane has landed'
  end

  def check_if_already_flying
    fail "you are flying already!" if @flying == true
  end

  def check_if_already_landed
    fail "your plane has already landed" if @flying == false
  end

  def flying?
    @flying
  end
end
