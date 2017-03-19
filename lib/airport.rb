class Airport
  attr_reader :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail 'Airport capacity is full' if full?
    fail 'The plane has already landed' if in_airport?(plane)
    # fail 'The weather is too stormy to land' if is_sunny?
    plane.land
    @planes << plane
  end

  def take_off(plane)
    fail 'The plane has already taken off' unless in_airport?(plane)
    plane.take_off
    @planes.delete(plane)
  end

  def in_airport?(plane)
    @planes.include?(plane)
  end

  def is_sunny?
    Weather.new.is_sunny?
  end

  private
  attr_reader :planes

  def full?
    @planes.count >= capacity
  end
end
