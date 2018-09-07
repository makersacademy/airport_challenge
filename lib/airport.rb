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
    @hangar << plane

  end

  def take_off(plane)
    fail 'No take off, weather is stormy!' if stormy?
    @hangar.delete(plane)
  end

  def plane_in_hangar?(plane)
    @hangar.include?(plane)
  end

  def stormy?
    weather = [true, false, false, false, false]
    weather.sample
  end

  def full?
    @hangar.count >= @capacity
  end

end
