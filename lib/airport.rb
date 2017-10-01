class Airport
  DEFAULT_CAPACITY = 10

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Airport is full!" if full?
    @planes << plane
    @plane = plane
  end

  def take_off
    fail "no planes available for take-off!" if empty?
    @planes.pop
  end

  private

  def full?
    @planes.count >= @capacity
  end

  def empty?
    @planes.empty?
  end


end
