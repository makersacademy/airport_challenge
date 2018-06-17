class Plane
  def initialize(current_location: :airborne)
    current_location.store_plane(self) if current_location.class == Airport
    @current_location = current_location
  end

  attr_reader :current_location

  def land(location)
    location.request_landing
    location.store_plane(self)
    @current_location = location
  end

  def take_off
    @current_location.request_takeoff
    @current_location.remove_plane(self)
    @current_location = :airborne
  end
end
