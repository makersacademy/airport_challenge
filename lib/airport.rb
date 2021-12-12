class Airport
  attr_reader :capacity
  attr_reader :hangar

  DEFAULT_CAPACITY = 1

  def initialize(capacity=DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end
  
  def empty?
    true
  end

  def full?
    @hangar.count >= capacity
  end

  def receive(plane)
    fail "Sorry, Hangar Full" if full?
    @hangar << plane
  end
end
