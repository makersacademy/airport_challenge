class Plane

  def initialize(in_flight = true)
    @in_flight = in_flight
  end

  def land_plane
    @in_flight = !@in_flight
  end

  def take_off
    fail 'Cannot take off: already in flight' if flying?

    @in_flight = true
  end

  def flying?
    @in_flight
  end

end