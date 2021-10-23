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

  def take_off
    "Taken Off"
  end

  private 

  def full?
    @planes.length >= @capacity
  end

end