require_relative "plane"
require_relative "weather"
require_relative "airport"

class AirTrafficControl

  attr_reader :airport, :planes

  def initialize
    @planes = []
    @airport = Airport.new
  end

  def override_airport_capacity(int = nil)
    @airport.update_capacity(int)
  end

  def new_plane
    plane = Plane.new
    @planes << plane
    plane
  end

  def order_land(plane)
    fail fail_message_rnp if plane.class != Plane
    plane.land_at_airport(@airport)
    plane
  end

  def order_launch(plane)
    fail fail_message_rnp if plane.class != Plane
    plane.launch_from_airport(@airport)
    plane.confirm_flying
    plane
  end

  private

  def fail_message_rnp
    'Call error: must include a Plane as an argument'
  end

end
