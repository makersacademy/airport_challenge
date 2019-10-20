class Airport
  def initialize(capacity = 10)
    @planes = 0
    @capacity = capacity
  end

  def plane_takes_off
    raise 'Too stormy for takeoff' if stormy?

    @planes -= 1
  end

  def plane_lands
    raise 'Too stormy for landing' if stormy?
    raise 'Airport is full' if plane_count >= @capacity

    @planes += 1
  end

  def plane_count
    @planes
  end

  def stormy?
    rand > 0.7
  end
end
