class Airport

  attr_reader :planes
  DEFAULT_CAPACITY = 50

  def initialize
    @planes = []
  end

  def land(plane)
    fail "Airport is full" if full?
    @planes << plane
  end

  def take_off
    fail "No planes available" if empty?
    @planes.pop
  end

  private

  def full?
    @planes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @planes.empty?
  end

end
