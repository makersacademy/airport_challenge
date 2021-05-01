require './lib/plane.rb'
class Airport
  attr_reader :hangar
  DEFAULT_CAPACITY = 50
  def initialize
    @hangar = []
  end
  def land(plane)
    raise 'Hangar is full!' if @hangar.length >= DEFAULT_CAPACITY
    @hangar << plane 
  end

  def take_off(plane)
    @hangar.delete(plane)
  end
end