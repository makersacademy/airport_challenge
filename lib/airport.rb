require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 10

  attr_accessor :capacity

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def take_off
    fail 'No planes available to take-off' if empty?
    @planes.pop
  end

  def land(plane)
    fail 'The airport is full' if full?
    @planes << plane
  end

  private

  attr_reader :planes

  def full?
    @planes.count >= capacity
  end

  def empty?
    @planes.empty?
  end

end
