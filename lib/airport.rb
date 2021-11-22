require_relative 'plane'

class Airport

  attr_reader :planes
  attr_accessor :capacity
  DEFAULT_CAPACITY = 25

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    fail "Airport is full" if planes.count >= capacity
    fail "Stormy weather, can't land" if stormy?
    fail "This plane has already landed" if landed?(plane)
    planes << plane
  end

  def take_off
    fail "Stormy weather, can't take off" if stormy?
    fail "Airport is empty, no planes can take off" if empty?
    planes.pop
  end

  def stormy?
    rand(0..10).zero?
  end

  def landed?(plane)
    planes.include? plane
  end

  def empty?
    planes.empty?
  end

end
