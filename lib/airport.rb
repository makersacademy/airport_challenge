require_relative 'plane.rb'

class Airport

  attr_reader :capacity, :planes

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def take_off
    fail "No planes to take off" if empty?
    @planes.pop
  end

  def land(plane)
    fail 'Airport is full' if full?
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
