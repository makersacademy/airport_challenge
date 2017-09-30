class Plane
  attr_accessor :location, :airborne

  def initialize
    @airborne = false
    @location = 'Heathrow'
  end

  def land_at airport, weather
    raise 'Already at airport' if airport.check_for_plane(self)
    raise 'Not in the air' unless @airborne
    raise 'Too dangerous to land' if weather.stormy
    @location = airport.name
    @airborne = false
    airport.register_arrival self
  end

  def take_off airport, weather
    raise 'Not parked at airport' unless airport.check_for_plane(self)
    raise 'Already in the air' if @airborne
    raise 'Too dangerous to take off' if weather.stormy
    @location = 'in_flight'
    @airborne = true
    airport.register_departure self
  end
end
