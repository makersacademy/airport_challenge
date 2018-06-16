class Plane
  def initialize(current_location: :airborne)
    @current_location = current_location
  end

  attr_reader :current_location

  def land(location)
    location.request_landing
    location.store_plane(self)
    @current_location = location
  end

  def take_off
  end
end
