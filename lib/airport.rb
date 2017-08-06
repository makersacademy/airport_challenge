class Airport

  DEFAULT_CAPACITY = 50

  attr_accessor :planes, :capacity, :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes ||= []
    @capacity = capacity
    @weather = Weather.new
  end

  def open?
    true
  end

  def land(plane)
    raise "Airport is full!" if full?
    @planes << plane
    p @planes.count
  end

  def take_off(plane)
    raise "Cannot take off" if stormy?
    @planes.delete(plane)
    p @planes.count
  end

private

  def full?
    @planes.count >= @capacity
  end

  def stormy?
    weather.forecast
  end

end
