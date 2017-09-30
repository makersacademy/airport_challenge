class Plane
  attr_accessor :destination
  def fly_to airport
    @destination = airport
    airport.land self
  end

  def take_off airport
    raise 'Not parked at airport' if !airport.check_for_plane(self)
    @destination = nil
    airport.leave self
  end
end
