class Airport
  DEFAULT_CAPACITY = 10

  def initialize
    @planes = 0
  end

  def plane_takes_off
    raise 'Too stormy for takeoff' if stormy?

    @planes -= 1
  end

  def plane_lands
    raise 'Too stormy for landing' if stormy?

    @planes += 1
  end

  def plane_count
    @planes
  end

  def stormy?
    rand > 0.7
  end
end
