require_relative 'plane'
class Airport
  attr_reader :runway

  def initialize
    @runway = []
  end

  def empty?
    @runway.length.zero? ? true : false
  end

  def land(plane)
    @runway.push(plane)
  end

  def take_off
    fail("There are no planes to take off") if empty?

    @runway.pop
  end
end
