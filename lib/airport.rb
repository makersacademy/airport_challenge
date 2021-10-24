class Airport

  attr_reader :planes

  def initialize
    @planes = []
    @capacity = 50
  end

  def land(plane)
    fail "Airport is full" if full?
    @planes << plane
  end

  def take_off
    fail "No planes available" if empty?
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
