require_relative 'plane'

class Airport

  def initialize(capacity = 20)
    @capacity = capacity
    @planes_landed = []
  end

  def land(plane)
    raise 'Airport has reached capacity therefore you cannot land' if full?
    raise "Can't land plane weather is stormy" if stormy?
    @planes_landed << plane
  end

  def take_off(plane)
    raise "Can't take off plane weather is stormy" if stormy?
    'Plane has left the airport'
  end

  private 

  def stormy?
    rand(1..7) > 5
  end

  def full?
    @planes_landed.length >= @capacity
  end

end
