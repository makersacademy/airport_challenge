require './lib/plane'

class Airport
  DEFAULT_CAP = 5
  attr_reader :capacity
  attr_reader :planes

  def initialize(capacity = DEFAULT_CAP)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail "Airport is full" if full?

    planes << plane
  end

  def take_off
    fail "No planes in airport" if empty?

    planes.pop
  end

  private

  def full?
    planes.count >= capacity
  end

  def empty?
    planes.empty?
  end
end
