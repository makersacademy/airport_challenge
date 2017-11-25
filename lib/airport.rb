class Airport
  DEFAULT_CAPACITY = 100
  attr_reader :planes
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
  @planes = []
  @capacity = capacity
  end

  def land(plane)
    raise "Airport full" if full?
    @planes << plane
  end

  def take_off
    raise "There are no planes to take off" if empty?
    @planes.pop
  end

  private
  def full?
    @planes.length >= capacity
  end

  def empty?
    @planes.empty?
  end
end
