class Airport

  def instructs_landing(plane)
    true
  end

  def confirms_landing(plane)
    true
  end

  def instructs_takeoff(plane)
    true
  end

  def confirms_takeoff(plane)
    true
  end

  def cannot_land(plane)
    raise 'Cannot land as airport is full' if full?
  end

  private

  def full?
    true
  end

end
