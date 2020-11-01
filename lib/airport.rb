class Airport
  attr_accessor :capacity
  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise "ATTENTION - It is not possibile to land because the airport is full!" if full?
    @planes << plane
  end

  def take_off(plane)
  end

  private

  def full?
    @planes.length >= @capacity
  end
end
