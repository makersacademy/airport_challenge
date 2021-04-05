require_relative 'plane'

class Airport
  attr_accessor :hangar, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    fail 'Error: Cannot land plane, hangar is full' if full?
    @hangar << plane
  end

  def take_off(plane)
    
  end

  private

  def full?
    @hangar.length >= @capacity
  end

end
