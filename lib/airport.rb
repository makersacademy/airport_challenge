require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :hangar, :capacity, :full

  MAXCAPACITY = 5

  def initialize
    @hangar = []
    @full = false
  end

  def capacity(capacity=MAXCAPACITY)
    @capacity = capacity
  end

  def full?
    if @hangar.empty? || (@hangar.length < @capacity)
      @full = false
    else
      @full = true
    end
  end

  def land(arg)
    fail "It's too stormy for landing" if Weather.new.stormy
    fail "That plane has already landed" if @hangar.include?(arg)
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
