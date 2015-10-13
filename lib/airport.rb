class Airport
  def land(plane)
    fail 'Cannot land since airport is full' if @plane
    @plane = plane
  end

  def take_off(plane)

  end

  def report_storm

  end
end
