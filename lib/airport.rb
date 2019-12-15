require_relative 'plane'

class Airport
  attr_accessor :runway, :capacity
  DEFAULT = 3
  def initialize(capacity = DEFAULT)
    @runway = []
    @capacity = capacity
  end

  def land(plane)
    raise "Stormy we cannot take-off currently" if stormy?

    raise "No space left on the runway" if full?

    @runway << plane
  end

  def takeoff
    raise "Stormy please wait on the runway" if stormy?

    raise "There are no planes on the runway" if empty?

    @runway.pop
    confirm
  end

  def confirm
    @runway.size
  end

  def empty?
    @runway.size.zero?
  end

  def full?
    capacity == confirm
  end

  def stormy?
    !(rand(10) >= 9)
  end
end
