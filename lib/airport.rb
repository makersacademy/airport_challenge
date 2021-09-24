require './lib/plane.rb'

class Airport
  DEFAULT_CAPACITY = 20

  attr_accessor :capacity
  attr_reader :hangar

  def initialize(capacity=DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    fail "Airport is full, cannot land plane" if full?
    @hangar << plane
  end

  def takeoff
    fail "No planes to takeoff" if empty?
    puts "Plane #{@hangar[-1]} has taken off"
    @hangar.pop
  end

  private

  def empty?
    @hangar.empty?
  end

  def full?
    @hangar.count >= @capacity
  end
end