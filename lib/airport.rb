require_relative "plane"

class Airport

  def initialize(capacity = 10)
  @capacity = capacity
  @planes = []
  end

  attr_reader :planes

  def takeoff(plane)
    fail "The airport is empty" if empty?
  @planes.delete(plane)
  end

  def land(plane)
    fail "Airport full" if full?
  @planes << plane
  end

  private

  def full?
  @planes.count >= @capacity
  end

  def empty?
  @planes.empty?
  end

end
