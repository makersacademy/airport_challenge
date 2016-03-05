class Airport

  DEFAULT_CAPACITY = 10
  attr_reader :capacity
  attr_reader :planes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @closed = false
  end

  def closed?
    @closed
  end

  def closed=(value)
    @closed = value
  end

  def include?(plane)
    planes.include?(plane)
  end

  def land(plane)
    raise ("Airport is closed") if closed?
    raise ("Airport is full") if full?
    plane.flying = false
    planes << plane
  end

  def take_off
    raise ("Airport is closed") if closed?
    plane = planes.pop
    plane.flying = true
    plane
  end

private
  def full?
    planes.length >= capacity
  end
end
