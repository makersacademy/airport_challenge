require './lib/plane.rb'

class Airport
  attr_accessor :capacity
  attr_reader :runway, :stormy
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @runway = []
    @capacity = capacity
  end

  def land(plane)
    fail 'Airport full' if full?

    @runway << plane
  end

  def take_off
    fail 'No planes at airport' if empty?

    @runway.pop
  end

  def full?
    @runway.count >= capacity
  end

  def empty?
    @runway.empty?
  end

  def weather?
    @stormy = true
  end

  def stormy?
    @stormy
  end
end
