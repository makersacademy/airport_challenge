require_relative 'plane'

class Airport
  def initialize(capacity)
    @capacity = capacity
    @planes = []
  end

  attr_reader :planes, :capacity

  def land(plane)
    fail "Full capacity reached! You can not land here." if full?
    @planes << plane
  end

  def take_off(plane)
    @planes.delete(plane)
  end

  private
  def full?
    planes.count >= capacity
  end

end