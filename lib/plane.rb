class Plane
  attr_accessor :destination, :airborne

  def initialize
    @airborne = false
  end

  def fly_to airport
    raise 'Already at airport' if airport.check_for_plane(self)
    raise 'Not in the air' if !@airborne
    @destination = airport
    @airborne = false
    airport.land self
  end

  def take_off airport
    raise 'Not parked at airport' if !airport.check_for_plane(self)
    raise 'Already in the air' if @airborne
    @destination = nil
    @airborne = true
    airport.leave self
  end
end
