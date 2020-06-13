class Airport

  DEFAULT_CAPACITY = 1

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    fail 'This airport is full' if full?

    @planes << plane
  end

  private

  def full?
    @planes.count >= DEFAULT_CAPACITY
  end
end