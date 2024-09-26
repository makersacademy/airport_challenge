class Airport

  DEFAULT_CAPACITY = 10

  attr_reader :hangar
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    @hangar << plane
    fail 'Airport is full' if @plane
    @plane = plane
  end

  def take_off(plane)
    @hangar.delete(plane)
  end
end
