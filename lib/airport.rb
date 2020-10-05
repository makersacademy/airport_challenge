require_relative 'plane'
require_relative 'weather'
class Airport 
  DEFAULT_CAPACITY = 10
  attr_reader :runway, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @runway = []
  end

  def empty?
    @runway.length.zero? ? true : false
  end

  def full?
    @runway.length >= DEFAULT_CAPACITY
  end

  def land(plane)
    fail "Error, runway is full" if full?
    
    fail "Stormy weather, unable to land in these conditions." if @stormy

    @runway.push(plane)
  end

  def take_off
    fail "There are no planes to take off" if empty?

    @runway.pop
  end
end
