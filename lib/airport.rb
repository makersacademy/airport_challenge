require './lib/plane'
class Airport
  attr_accessor :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    @hangar << plane
  end

  def take_off(plane)
    @hangar.pop(plane)
    "Airborne!"
  end
end
