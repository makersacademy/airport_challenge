require_relative 'airport'

class Plane
  def land(airport)
    airport.request_landing(self)
    @airport = airport
  end

  def take_off
    @airport.request_take_off(self)
    @airport = ""
  end
end
