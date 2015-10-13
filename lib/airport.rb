class Airport
  def land(plane)
    fail 'Cannot land since airport is full' if @plane
    fail 'Unable to land due to stormy weather' if @stormy
    @plane = plane
  end

  def take_off(plane)

  end

  def report_storm
    @stormy = true
  end
end
