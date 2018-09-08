class Airport
  CAPACITY = 20

  attr_reader :hangar, :capacity

  def initialize(capacity = CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    fail 'No landing, weather is stormy!' if stormy?
    fail 'Airport is full!' if full?
    fail 'Plane already landed!' if plane.flying == false
    @hangar << plane
    plane.flying = false
  end

  def take_off(plane)
    fail 'No take off, weather is stormy!' if stormy?
    fail 'Plane already flying!' if plane.flying
    @hangar.delete(plane)
    plane.flying = true
  end

  def plane_in_hangar?(plane)
    @hangar.include?(plane)
  end

  def stormy?
    (0..10).sample > 8
  end

  def full?
    @hangar.count >= @capacity
  end

end
