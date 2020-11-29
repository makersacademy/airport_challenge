class Airport
  attr_reader :planes
  DEFAULT_CAPACITY = 100

  def initialize(capacity: DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land_a_plane(plane)
    fail 'Weather is stormy' if stormy?
    fail 'Airport is full' if full?
    @planes << plane
  end

  def take_off(plane)
    fail 'Weather is stormy' if stormy?
    @planes.delete(plane)
  end

  def has_plane?(plane)
    @planes.include?(plane)
  end

  private

  def full?
    @planes.size >= @capacity
  end

  def stormy?
    rand(1..100) > 95
  end
end
