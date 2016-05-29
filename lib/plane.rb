require_relative 'airport'

class Plane

  def take_off
    fail "Plane cannot take-off: plane already flying"
  end

  def land(airport)
    @airport = airport
  end

  def airport
    @airport
  end

end