require_relative 'weather'

class Airport
  include Weather

DEFAULT_CAPACITY = 20
  attr_reader :planes, :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "airport full, find another lol" if full?
    @planes << plane
  end

  def take_off
  end

  private

  def full?
    @planes.size >= 20
  end
end
