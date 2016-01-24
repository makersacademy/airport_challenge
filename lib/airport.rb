class Airport

  attr_reader :capacity, :stored_planes

  CAPACITY = 5

  def initialize(capacity = CAPACITY)
    @capacity = capacity
    @stored_planes = Array.new
  end

  def set_capacity(capacity)
    @capacity = capacity
  end

  def take_off(plane, weather)
    raise 'Plane already in flight' if plane.in_flight
    raise 'Plane not at airport' unless stored?(plane)
    raise 'Weather is stormy: unsafe to take off' if weather.stormy?
    @stored_planes.delete(plane)
    confirmation(plane)
    plane.flight_status
  end

  def full?
    @stored_planes.length >= @capacity
  end

  def stored?(plane)
    @stored_planes.include?(plane)
  end

  def confirmation(plane)
    p "#{plane} has taken off and is no longer at #{self}"
  end

end
