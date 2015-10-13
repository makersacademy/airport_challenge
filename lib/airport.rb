class Airport
  def land(plane)
    fail 'Cannot land since airport is full' if @plane
    fail 'Unable to land due to stormy weather' if @stormy
    @plane = plane
  end

  def take_off(plane)
    fail 'Unable to take off due to stormy weather' if @stormy
    fail 'The plane is not currently landed at this airport' unless has?(plane)
  end

  def report_storm
    @stormy = true
  end

  private

  def has?(plane)
    @plane == plane
  end
end
