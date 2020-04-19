require './lib/plane'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    fail "Airport is full" if capacity
    @planes << plane
  end

  def take_off
    fail "No planes in airport" if empty?
    @planes.pop
  end

  def capacity(full = 1)
    @planes.count == full
  end

  private
  def empty?
    @planes.empty?
  end
end
