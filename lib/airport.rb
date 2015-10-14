class Airport

  def initialize(capacity: 1)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail 'Cannot land since airport is full' if full?
    fail 'Unable to land due to stormy weather' if stormy?
    planes << plane
    self
  end

  def take_off(plane)
    fail 'Unable to take off due to stormy weather' if stormy?
    fail 'The plane is not currently landed at this airport' unless has?(plane)
  end

  private

  attr_reader :planes, :capacity, :stormy
  alias_method :stormy?, :stormy

  def has?(plane)
    planes.include?(plane)
  end

  def full?
    planes.count >= capacity
  end
end
