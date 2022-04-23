class Airport

  DEFAULT_CAPACITY = 1

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  attr_accessor :capacity

  def land(plane)
    fail 'Airport full' if @planes.count >= @capacity
    @planes << plane
  end

  def take_off(plane)
    @planes.pop
    "#{plane} no longer in #{self} airport"
  end

end
