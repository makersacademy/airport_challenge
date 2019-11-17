class Airport

  DEFAULT_CAPACITY = 50

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @capacity = capacity
    @weather = weather
    @planes = []
  end

  def land(plane)
    fail "Cannot land due to stormy weather" if weather.stormy?
    fail "Cannot land as the airport is full" if full?
    fail "Cannot land as the plane has already landed" if plane.landed?

    plane.land
    @planes.push(plane)
    plane
  end

  def take_off(plane)
    fail "Cannot take off due to stormy weather" if weather.stormy?
    fail "Cannot take off as plane not landed" unless @planes.include?(plane)

    plane.take_off
    @planes.delete(plane)
  end

  private

  attr_reader :weather, :planes

  def full?
    @planes.count >= @capacity
  end

end
