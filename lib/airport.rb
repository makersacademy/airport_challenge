require_relative 'plane.rb'

class Airport
DEFAULT_CAPACITY = 5
  def initialize
    @hangar = []
  end

  attr_reader :hangar

  def land(plane)
    raise 'Hangar full.' if @hangar.size == 5

    @hangar << plane
    plane
  end

  def take_off(plane)
    plane
  end
end
