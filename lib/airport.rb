require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :hangar, :capacity

  MAXCAPACITY = 5

  def initialize(capacity=MAXCAPACITY)
    @capacity = capacity
    @hangar = []
  end

  def full?
    @full = true if (@hangar.length >= @capacity)
  end

  def land(plane)
    fail "It's too stormy for landing" if Weather.new.stormy
    fail "That plane has already landed" if @hangar.include?(plane)
    fail "The airport is full" if self.full?
    plane.landed = true
    @hangar << plane
  end

  def take_off(plane)
    fail "It's too stormy for take-off" if Weather.new.stormy
    fail "That plane has already taken off" unless @hangar.include?(plane)
    plane.landed = false
    @hangar.delete(plane)
  end

end
