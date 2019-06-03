require_relative 'plane'
class Airport
  attr_accessor :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    @hangar << plane
  end

  def take_off(plane)
    @hangar.delete(plane)
    "Airborne!"
  end
end
