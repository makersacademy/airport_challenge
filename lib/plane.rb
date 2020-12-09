class Plane
  attr_reader :landed_at

  def initialize(airport = -1)
    @landed_at = airport # nb that we will consider the value of -1 to mean the airport is in flight
  end

  def land(airport)
    raise StandardError.new "This plane is already at an airport" if @landed_at != -1
    raise StandardError.new "The plane cannot be landed at this airport because of stormy weather" unless airport.good_weather?

    raise StandardError.new "The plane cannot be landed at this airport because the airport is full" unless airport.space?

    @landed_at = airport
    airport.land_plane(self)
  end

  def take_off(airport)
    raise StandardError.new "This plane cannot take off as it is not at an airport" if @landed_at == -1
    raise StandardError.new "The pane can't take off from an airport that it is not at" if @landed_at != airport
    raise StandardError.new "The plane cannot take off from this airport because of stormy weather" unless airport.good_weather?

    @landed_at = -1
    airport.takeoff_plane(self)
  end

  def at_airport?(airport)
    return false unless @landed_at == airport

    return true
  end
end
