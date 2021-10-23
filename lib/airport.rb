class Airport
    attr_accessor :capacity, :planes
    DEFAUlT_CAPACITY = 20

  def initialize(capacity = DEFAUlT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail "This airport is full" if full?
    @planes << plane
  end

  def take_off(plane)
    fail "Can't take off weather is stormy" if stormy?
    "Taken Off"
  end

  private 

  def full?
    @planes.length >= @capacity
  end

  def stormy?
    true
  end

end