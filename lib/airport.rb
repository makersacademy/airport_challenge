

class Airport
  attr_accessor :planes
  attr_accessor :capacity
  attr_accessor :weather
  DEFAULT_CAPACITY = 1
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = ['sunny','sunny','stormy','sunny','sunny','sunny','stormy','sunny','sunny','sunny'].sample
  end

  def land(plane)
    fail "This plane is already landed" if plane.status != 'air'
    fail "You can't land when it is stormy" if weather == 'stormy'
    fail "The airport is full" if full?
    plane.status = self
    @planes << plane
  end

  def take_off(plane)
    fail "This plane is not in this airport" if plane.status != self
    fail "You can't take off when it is stormy" if weather == 'stormy'
    plane.status = 'air'
    @planes.delete(plane)
  end

  private

  def full?
    @planes.length == @capacity
  end

end
