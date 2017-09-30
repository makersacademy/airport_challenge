class Plane

  def initialize
    @landed
  end

  def land_at(airport)
    raise 'plane has already landed' if @landed
    raise 'cannot land in stormy weather' unless airport.clear?
    raise 'cannot land at full airport' unless airport.planes.count < airport.capacity
    airport.planes << self
    @landed = true
  end

  def take_off_from(airport)
    raise 'cannot take off in stormy weather' unless airport.clear?
    airport.planes.delete(self)
    @landed = false
  end

  def at?(airport)
    airport.planes.include?(self)
  end

end