class Plane

  def initialize
    @landed
  end

  def land_at(airport)
    raise 'plane has already landed' if @landed
    raise 'cannot land at full airport' if airport.full?
    raise 'cannot land in stormy weather' unless airport.clear?
    airport.planes << self
    @landed = true
  end

  def take_off_from(airport)
    raise 'plane is already in the air' unless @landed
    raise 'cannot take off in stormy weather' unless airport.clear?
    airport.planes.delete(self)
    @landed = false
  end

  def at?(airport)
    airport.planes.include?(self)
  end

end