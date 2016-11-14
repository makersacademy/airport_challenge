require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 10

  attr_reader :planes :weather

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def receive_plane(plane)
    raise 'Airport is full, no landing this time' if is_full?
    @planes << plane
  end

  def take_off
    raise 'The airport is empty, no planes to take off' if is_empty?
    @planes.shift
  end

  def is_full?
    @planes.count >= DEFAULT_CAPACITY
  end

  def is_empty?
    @planes.empty?
  end

end
