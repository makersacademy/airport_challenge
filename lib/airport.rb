class Airport
  DEFAULT_CAPACITY = 10

  attr_reader :hangar, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    fail 'Airport at full capacity' if hangar_capacity_reached?
    @hangar.push(plane)
  end

  def take_off(plane)
    fail 'Airport is empty' if hangar_empty?
    @hangar.delete(plane)
  end

  def hangar_capacity_reached?
    @hangar.length >= @capacity
  end

  def hangar_empty?
    @hangar.empty?
  end
end
