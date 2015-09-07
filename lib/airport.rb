require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 10

  def initialize
    @planes = []
  end

  def capacity
    DEFAULT_CAPACITY
  end

  def release(plane)
    fail 'airport empty' if empty?
    @planes.pop
  end

  def receive(plane)
    fail 'airport full' if full?
    @planes << plane
  end

  private

  def full?
    @planes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @planes.empty?
  end
end
