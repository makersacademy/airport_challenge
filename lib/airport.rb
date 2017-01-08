require_relative 'plane'

class Airport
  def initialize(capacity)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'Unable to land: Weather is stormy' if stormy?
    raise 'Unable to land: Airport is full' if full?
    @planes << plane
  end

  def take_off(plane)
    raise 'Unable to take off: Weather is stormy' if stormy?
  end


private

  def full?
    @planes.size >= @capacity
  end

  def stormy?
    rand(1..6) > 4
  end
end
