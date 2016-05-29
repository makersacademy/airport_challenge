class Airport

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail 'Sorry, we\'re full. Try somewhere else' if full?
    @planes << plane
  end

  def take_off(plane)
    @planes.pop
  end

  private

  def full?
    @planes.count >= @capacity
  end
end
