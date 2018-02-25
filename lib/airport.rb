class Airport
  DEFAULT_CAPACITY = 10

  attr_reader :hangar, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    fail 'Airport at full capacity' if capacity_reached?
    @hangar.push(plane)
  end

  def take_off(plane)
    @hangar.delete(plane)
  end

  def capacity_reached?
    @hangar.length >= @capacity
  end
end
