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
    if Weather.new.stormy
      fail "It's too stormy for landing"
    elsif @hangar.include?(arg)
      fail "That plane has already landed"
    else
      arg.landed = true
      @hangar << arg
    end
  end

  def take_off(arg)
    if Weather.new.stormy
      fail "It's too stormy for take-off"
    elsif @hangar.include?(arg)
      arg.landed = false
      @hangar.delete(arg)
    else
      fail "That plane has already taken off"
    end
  end

end
