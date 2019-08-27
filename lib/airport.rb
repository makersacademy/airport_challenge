class Airport
  DEFAULT_CAPACITY = 40

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise 'cannot let plane land due to stormy weather' if stormy?
    raise 'cannot land plane; airport full.' if full?
    @planes << plane

  end

  def stormy?
    rand(1..6) > 4
  end

  def takeoff(plane)
    raise 'cannot let plane takeoff due to stormy weather' if stormy?
  end

  def full?
    @planes.length >= @capacity
  end


end
