class Airport
  attr_reader :planes
  DEFAULT_CAPACITY = 10

  def initialize(capacity: DEFAULT_CAPACITY, weather:)
    @capacity = capacity
    @planes = []
    @weather = weather
  end

  def land(plane)
    raise 'Plane cannot land as airport is full' if full?
    raise 'Cannot land due to stormy weather' if @weather.stormy?

    plane.land
    @planes << plane
  end

  def full?
    @planes.count == @capacity
  end

  def take_off_plane(plane)
    raise 'Plane is not in this airport' unless in_airport?(plane)
    raise 'Cannot take off due to stormy weather' if @weather.stormy?

    @planes.delete(plane)
  end

  def in_airport?(plane)
    @planes.include?(plane)
  end

  private :full?
end
