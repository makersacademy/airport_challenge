require_relative 'plane'

class Airport
DEFAULT_CAPACITY = 20

attr_reader :planes, :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def allow_landing(plane)
    raise "CANNOT LAND IN A STORM" if stormy?
    raise "CANNOT LAND AIRPORT IS FULL" if full?
    @planes << plane
  end

  def allow_take_off(plane)
    raise "CANNOT TAKE-OFF IN A STORM" if stormy?
    @planes.delete(plane)
  end

  def stormy?
    number = rand(0..10)
    number == 5 ? true : false
  end

private

  def full?
    @planes.length >= @capacity ? true : false
  end

end
