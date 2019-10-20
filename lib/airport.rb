class Airport
  def initialize
    @planes = 0
  end

  def plane_takes_off
    @planes -= 1
  end

  def plane_lands
    @planes += 1
  end

  def plane_count
    @planes
  end

  def stormy?
    rand > 0.7
  end
end
