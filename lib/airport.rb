require_relative 'plane'
class Airport
  attr_accessor :runway , :capacity , :stormy
  DEFAULT_CAPACITY = 30

  def initialize(capacity = DEFAULT_CAPACITY)
    @runway = []
    @capacity = capacity
    stormy?
  end

  def land(plane)
    fail 'Cannot land in stormy weather' if stormy?
    fail 'Cannot land when airport is full' if full?
    @runway << plane
  end

  def take_off(plane)
    fail 'Cannot take off in stormy weather' if stormy?
    @runway.delete(plane)
  end

  def stormy?
    if rand(10) >= 1
      @stormy = true
    else
      @stormy = false
    end
  end

  def full?
    @runway.count >= @capacity
  end

  def empty?
    @runway.empty?
  end
end
