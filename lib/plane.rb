class Plane
  attr_reader :in_flight

  def initialize
    @in_flight = true
  end

  def take_off
    fail "Unable to take off: plane already flying" if in_flight_plane

    @in_flight = true
  end

  def land
    fail "Unable to land: plane already landed" if off_flight_plane

    @in_flight = false
  end

  private

  def in_flight_plane
    @in_flight
  end

  def off_flight_plane
    !@in_flight
  end
end
