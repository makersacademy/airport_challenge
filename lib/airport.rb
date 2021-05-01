require './lib/plane.rb'
class Airport
  attr_reader :hangar, :capacity
  DEFAULT_CAPACITY = 50
  def initialize(capacity=DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end
  def land(plane)
    raise 'Hangar is full!' if @hangar.length >= @capacity
    @hangar << plane 
  end

  def take_off(plane)
    @hangar.delete(plane)
  end
end