require_relative 'airport'

class Plane
  def land(airport)
    @airport = airport
    @airport.store_plane(self)
  end

  def take_off
    @airport.release_plane(self)
  end
end
