class Airport 
  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 1

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    fail 'landing prohibited: airport is full' if full?
    @planes << plane
  end

  def take_off
    fail 'take off failed: there are no planes at the airport' if empty?
    @planes.pop
  end

private

  def full?
    @planes.count >= capacity
  end

  def empty?
    @planes.empty?
  end
end