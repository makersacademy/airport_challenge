require_relative 'plane'

class Airport
  attr_reader :hangar
  DEFAULT_CAPACITY = 100

  def initialize
    @hangar = []
  end

  def land(plane)
    raise "Airport is full" if full?
    hangar << plane 
  end

  def take_off(plane)
    @hangar.pop
  end

  private

  def full?
    @hangar.count >= DEFAULT_CAPACITY
  end 

end
