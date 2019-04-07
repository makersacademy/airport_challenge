class Airport

  def initialize(capacity, weather_report)
    @capacity = capacity
    @weather_report = weather_report
    @hanger = []
  end

  def land_plane(plane)
    fail "Airport is full" if full?
    fail "Cannot land: weather is stormy" if stormy?
    @hanger << plane
  end

  def take_off(plane)
    fail "Cannot take off: weather is stormy" if stormy?
  end

  private

  def full?
    @hanger.count >= @capacity
  end

  def stormy?
    @weather_report.stormy?
  end

end
