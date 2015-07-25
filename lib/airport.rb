class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :planes

  def initialize
    @planes = []
  end
  def land plane
    full? ? (raise "Sorry, we're full!") : (@planes << plane)
  end
  def take_off plane
    @planes.pop
  end
  def full?
    planes.count >= DEFAULT_CAPACITY
  end
end
