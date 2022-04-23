class Airport

  def initialize(capacity = 1)
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
