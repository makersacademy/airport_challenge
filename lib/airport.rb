require_relative 'plane'

class Airport

  def initialize(capacity = 20)
    @capacity = capacity
    @planes_landed = []
  end

  def land(plane)
    raise 'Cannot land plane: Airport is at capacity' if full?
    raise "Cannot land plane: Weather is stormy" if stormy?
    plane.land(self)
    @planes_landed << plane
  end

  def take_off(plane)
    raise "Cannot take off plane: Weather is stormy" if stormy?
    raise 'Cannot take off plane: plane not at airport' unless at_airport?(plane)
    plane.take_off
    take_off_message
    plane
  end

  private 

  def stormy?
    rand(1..7) > 5
  end

  def full?
    @planes_landed.length >= @capacity
  end

  def at_airport?(plane)
    @planes_landed.include?(plane)
  end

  def take_off_message
    'Plane has left the airport'
  end

end
