require_relative './exceptions'

class Plane

  attr_reader :departure_airport
  attr_reader :destination_airport

  def initialize
    @flying = false
  end

  def land
    raise PlaneError, "Plane already on the ground" unless @flying
    @flying = false
  end

  def take_off
    raise PlaneError, "Plane already in-flight" if flying?
    @departure_airport.release_plane(self)
    @flying = true
  end

  def flying?
    @flying
  end

  def set_departure_airport(airport)
    @departure_airport = airport
  end

  def set_destination_airport(airport)
    @destination_airport = airport
  end

end
