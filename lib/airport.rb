require_relative 'plane'

DEFAULT_CAPACITY = 20

class Airport

attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise "Landing unathorised: unsafe weather conditions" if stormy?
    raise "Landing unauthorised: airport full" if full?
    @planes << plane
  end

  def take_off(plane)
    raise "Take-off unathorised: unsafe weather conditions" if stormy?
    @planes.delete(plane)
  end

  private

  def stormy?
    [true, false, false, false, false].sample
  end

  def full?
    @planes.length >= @capacity
  end

end
