
class Airport

  attr_reader :planes
  attr_accessor :capacity

  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = [] # we could use @planes.delete("planename")
    @capacity = capacity
  end

  def land(plane)
    fail 'hangar full' if full?
    @planes << plane
  end

  def take_off(plane)
    fail 'hangar empty' if empty?
    @planes.delete(plane)
    return @planes
  end

private

  def full?
    @planes.count >= @capacity
  end

  def empty?
    @planes.empty?
  end
end
