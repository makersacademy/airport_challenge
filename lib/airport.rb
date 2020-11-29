class Airport
  attr_reader :planes
  DEFAULT_CAPACITY = 100

  def initialize(capacity: DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land_a_plane(plane)
    fail 'Airport is full' if full?
    @planes << plane
  end

  def take_off(plane)
    @planes.delete(plane)
  end

  def has_plane?(plane)
    @planes.include?(plane)
  end

  private

  def full?
    @planes.size >= @capacity
  end
end
