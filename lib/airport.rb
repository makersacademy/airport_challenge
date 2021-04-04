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
    fail 'Airport is full' if full?

    @plane << plane
  end

  def take_off
    fail 'No plane available' if empty?

    @plane.pop
  end

  private

  def full?
    @plane.count >= capacity
  end

  def empty?
    @plane.empty?
  end
end
