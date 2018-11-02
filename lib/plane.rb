require_relative 'airport'

class Plane
  def initialize
    @current_status = "flying"
  end

  def land(airport)
    @airport = airport
    fail "The plane has already landed" if @current_status == "landed"
    fail "Too stormy for this" if @airport.weather == "stormy"
    @airport.store_plane(self)
    @current_status = "landed"
  end

  def take_off
    fail "The plane is already in the air" if @current_status == "flying"
    fail "Too stormy for this" if @airport.weather == "stormy"
    @airport.release_plane(self)
    @current_status = "flying"
  end
end
