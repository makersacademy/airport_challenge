class Airport
  AIRPORT_CAPACITY = 20

  attr_reader :hangar, :airport_capacity, :weather

  def initialize(airport_capacity = AIRPORT_CAPACITY, weather = Weather.new)
    @hangar = []
    @airport_capacity = airport_capacity
    @weather = weather
  end

  def land(plane)
    fail 'No landing, weather is stormy!' if stormy?
    fail 'Airport is full!' if full?
    fail 'Plane already landed!' if plane_in_hangar?(plane)
    @hangar << plane
    plane.landed
    'Plane has landed!'
  end

  def take_off(plane)
    fail 'No take off, weather is stormy!' if stormy?
    fail 'Plane already flying!' if plane.flying?
    fail 'Plane not in hangar!' unless plane_in_hangar?(plane)
    plane.takeoff
    @hangar.delete(plane)

    'Plane has taken off!'
  end

  def stormy?
    @weather.stormy?
  end

 private
  def plane_in_hangar?(plane)
    @hangar.include?(plane)
  end

  def full?
    @hangar.count >= @airport_capacity
  end
end
