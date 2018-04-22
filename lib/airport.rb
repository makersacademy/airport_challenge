require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 3
  attr_reader :hangar
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def take_off(plane)
    fail 'No planes available' if empty?
    @hangar.delete(plane)
  end

  def land(plane)
    fail 'Airport is full' if full?
    @hangar << plane
    @hangar[-1]
  end

  private

  def full?
    @hangar.count >= capacity
  end

  def empty?
    @hangar.empty?
  end

end
