class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :planes

  def initialize(opts)
    @capacity = opts.fetch(:capacity, DEFAULT_CAPACITY)
    @weather_reporter = opts[:weather_reporter]
    @planes = []
  end

  def land(plane)
    raise 'Cannot land plane: airport full' if full?
    raise 'Cannot land plane: weather is stormy' if stormy?
    plane.land(self)
    planes << plane
  end

  def take_off(plane)
    raise 'Cannot take off plane: weather is stormy' if stormy?
    raise 'Cannot take off plane: plane not at this airport' unless at_airport?(plane)
    plane.take_off
    remove_plane(plane)
    plane
  end

  private

  attr_reader :capacity, :weather_reporter

  def full?
    planes.length >= capacity
  end

  def stormy?
    weather_reporter.stormy?
  end

  def at_airport?(plane)
    planes.include? plane
  end

  def remove_plane(plane)
    planes.delete_if { | landed_plane | landed_plane == plane }
  end
end
