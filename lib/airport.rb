require 'plane'

class Airport
  attr_reader :capacity
  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def take_off
    fail 'No plane at airport' if empty?
    @planes.delete_at(rand(@planes.size))
  end

  def land(plane)
    fail "Airport full" if full?
    @planes << plane
  end

  private

  def full?
    @planes.size >= @capacity
  end

  def empty?
    @planes.empty?
  end
end
