class Airport

  DEFAULT_CAPACITY = 50

  attr_reader :capacity, :planes

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'Airport is full, plane cannot land' if full?
    @planes << plane
  end

  private

  def full?
    @planes.count >= @capacity
  end

end
