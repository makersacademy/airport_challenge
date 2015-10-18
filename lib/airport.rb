class AirPort

  DEFAULT_CAPACITY = 10

  attr_reader :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def land_safely(planes)
    fail 'airport is full' if full? || @stormy
    @planes << planes
  end

  def full?
    @planes.count >= @capacity
  end

  def take_off_safely
    fail 'can not take off' if @stormy?
  end

  def stormy?
    @stormy = true
  end
end
