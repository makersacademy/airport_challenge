require './lib/plane.rb'
class Airport
  attr_reader :hangar
  def initialize
    @hangar = []
  end
  def land(plane)
    raise 'Hangar is full!' if @hangar.length >= 50
    @hangar << plane 
  end

  def take_off(plane)
    @hangar.delete(plane)
  end
end