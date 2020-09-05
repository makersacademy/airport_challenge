class Airport

  attr_reader :DEFAULT_CAPACITY

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def clear_landing(plane)
    raise 'Airport is at capacity' if @planes.count == @capacity

    @planes << plane
  end

  def has_plane?(plane)
    @planes.include?(plane)
  end

  def clear_takeoff(plane)
    raise 'Plane is not at this airport' unless has_plane?(plane)

    raise 'Weather is stormy and too unsafe' if stormy?

    @planes.delete(plane)
  end

  private

  def stormy?
    weather == "stormy"
  end

  def weather
    rand(10) < 8 ? "sunny" : "stormy"
  end
end
