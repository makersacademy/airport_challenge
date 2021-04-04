require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :plane
  attr_accessor :capacity
  
  def initialize(capacity = DEFAULT_CAPACITY)
    @plane = []
    @capacity = capacity
  end

  def land(plane)
    fail 'landing not allowed when stormy' if stormy
    fail 'Airport is full' if full?

    @plane << plane
  end

  def take_off
    fail 'take off not allowed when stormy' if stormy
    fail 'No plane available' if empty?

    @plane.pop
  end

  def stormy
    rand(1..100) > 50
  end
  private

  def full?
    @plane.count >= capacity
  end

  def empty?
    @plane.empty?
  end
end
