require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 10

  attr_reader :planes, :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def receive_plane(plane, weather)
    raise 'Weather is stormy, cannot land at airport' if weather == :stormy
    raise 'Airport is full, no landing this time' if is_full?
    plane.land
    @planes << plane
  end

  def take_off(plane, weather)
    raise 'Weather is stormy, cannot take off from airport' if weather == :stormy
    raise 'The airport is empty, no planes to take off' if is_empty?
    plane.flying
    @planes.delete(plane)
  end

  def is_full?
    @planes.count >= @capacity
  end

  def is_empty?
    @planes.empty?
  end

end
