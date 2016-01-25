class Airport

  attr_reader :capacity, :stored_planes

  CAPACITY = 5

  def initialize(capacity = CAPACITY)
    @capacity = capacity
    @stored_planes = []
  end

  def amend_capacity(capacity)
    @capacity = capacity
  end

  def take_off(plane, weather)
    fail 'Plane in flight' if plane.in_flight
    fail 'Plane not at airport' unless stored?(plane)
    fail 'Unsafe to land due to weather' if weather.stormy?
    @stored_planes.delete(plane)
    confirmation(plane)
    plane.flight_status
  end

  def full?
    @stored_planes.length >= @capacity
  end

  private

  def stored?(plane)
    @stored_planes.include?(plane)
  end

  def confirmation(plane)
    p "#{plane} has taken off and is no longer at #{self}"
  end

end
