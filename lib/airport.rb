require './lib/plane.rb'
class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    @hangar << plane
  end

  def take_off
    @hangar.pop
    @hangar
  end
end
