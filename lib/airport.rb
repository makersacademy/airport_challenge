class Airport

  def initialize(capacity)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise "Cannot land plane - airport full" if full?
    raise "Cannot land plane - stormy weather" if stormy?
    @planes << plane
  end

  def take_off(plane)
    raise "Cannot take off plane - stormy weather" if stormy?
  end

  private

  def full?
    @planes.count >= @capacity
  end

  def stormy?
    rand(1..6) > 4
  end

end