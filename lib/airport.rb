class Airport

  attr_reader :planes, :weather

  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather = Weather.new
  end

  def take_off
    raise 'Cannot take off due to storms' if weather.stormy
    raise 'Plane not present' if !plane_docked(plane)
    @planes.delete(plane)
    "#{plane} has just taken off"
  end

  def land(plane)
    raise 'Plane is already at the airport!' if plane_docked(plane)
    raise 'Airport is full' if full?
    raise 'Cannot land due to storms' if weather.stormy?
    @planes << plane
    weather.what_weather
  end

  def plane_docked(plane)
    planes.include?(plane) ? true : false
  end

  private

  def full?
    @planes.count >= @capacity
  end

end