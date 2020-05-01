require_relative 'plane'

class Airport
  attr_accessor :inventory
  def initialize
    @inventory = []
  end
  def take_off(plane)
    self.inventory.delete(plane)
    plane.status = "airborne"
  end
end