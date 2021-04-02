require 'plane'

class Airport 
  attr_reader :plane, :hangar, :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    raise 'Airport is full' if full?
    @hangar.push(plane)
  end

  def take_off
    #removed argument, unnecessary unless you need to refer to specific planes later
    @hangar.pop
  end

  private 

  def full?
    @hangar.size >= capacity
  end

end
