class Airport
  DEFAULT_CAPACITY = 100

  attr_accessor :capacity

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    fail "Airport full" if full?
    
    planes << plane
  end

  def take_off
    fail "No planes in airport" if empty?

    planes.pop
  end

  private

  attr_reader :planes

  def full?
    planes.count >= capacity
  end

  def empty?
    planes.empty?
  end

end
