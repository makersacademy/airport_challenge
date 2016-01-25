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

  def land(arg)
    fail "It's too stormy for landing" if Weather.new.stormy
    fail "That plane has already landed" if @hangar.include?(arg)
    fail "The airport is full" if self.full?
    arg.landed = true
    @hangar << arg
  end

  def take_off(arg)
    fail "It's too stormy for take-off" if Weather.new.stormy
    fail "That plane has already taken off" unless @hangar.include?(arg)
    arg.landed = false
    @hangar.delete(arg)
  end

end
