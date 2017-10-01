class Plane
  attr_reader :landed_airport

  def initialize(landed_airport = nil)
    @landed_airport = landed_airport
  end

  def flying?
    @landed_airport == nil
  end

  def land_at_airport(airport)
    raise "plane has already landed" if flying? == false
    airport.receive_plane(self)
    @landed_airport = airport
  end

  def take_off_from_airport(airport)
    raise "plane is not at this airport" if landed_airport != airport
    airport.request_take_off(self)
    @landed_airport = nil
  end

end
