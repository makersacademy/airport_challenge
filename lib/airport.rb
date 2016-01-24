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
    raise 'Plane not at airport' unless stored?(plane)
    raise 'Unsafe to take off' if weather.stormy?
    @stored_planes.delete(plane)
  end

  def full?
    @stored_planes.length >= @capacity
  end

  def stored?(plane)
    @stored_planes.include?(plane)
  end

end
