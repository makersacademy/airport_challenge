require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :runway

  def initialize
    @runway = []
  end

  def land_plane(inbound_plane)
    fail "This plane has already landed" if already_landed(inbound_plane)
    inbound_plane.touch_down
    runway << inbound_plane
  end

  def take_off(departing_plane)
    fail "This plane is not in the airport" if not_in_airport(departing_plane)
    departing_plane.in_flight
    runway.delete(departing_plane)
  end

  private

  def not_in_airport(departing_plane)
    !runway.include?(departing_plane)
  end

  def already_landed(inbound_plane)
    runway.include?(inbound_plane)
  end

end
