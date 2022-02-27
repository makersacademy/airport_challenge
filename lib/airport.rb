class Airport

  DEFAULT_CAPACITY = 30

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def receive(plane)
    @hangar.push(plane)
  end

  def release(plane)
    @hangar.delete(plane)
  end

  def full?
    @hangar.length >= @capacity
  end
end
