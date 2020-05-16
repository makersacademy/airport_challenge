require_relative 'airport'

class Plane

  def land(airport)
    @airport = airport
  end

  def take_off(airport)
    "Plane is no longer in the airport"
  end
end
