

class Airport
  attr_accessor :planes

  def initialize
    @planes = []
    @capacity = 1
  end

  def land(plane)
    fail "The airport is full" if full?
    plane.status = 'ground'
    @planes << plane
  end

  def take_off(plane)
    plane.status = 'air'
    @planes.delete(plane)
  end

  private

  def full?
    @planes.length == @capacity
  end
end
