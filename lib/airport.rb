require_relative 'plane'
require_relative 'weather'
class Airport
  attr_reader :capacity, :planes

  DEFAULT_CAPACITY = 10

  def initialize (capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "The airport is full" if full?
    @planes << plane
  end

  def take_off(plane)
    fail "No planes at the airport" if empty?
    fail 'Bad weather for flying' if stormy?
    @planes.pop
  end

  private

  def full?
    planes.count >= @capacity
  end

  def empty?
    @planes.empty?
  end
end
