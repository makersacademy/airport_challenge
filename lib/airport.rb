require_relative '../lib/plane.rb'

class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    @hangar << plane
  end

  def take_off(plane)
    @hangar.pop
  end
end
