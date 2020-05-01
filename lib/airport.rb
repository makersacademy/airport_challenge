require_relative 'plane'

class Airport
  attr_accessor :inventory
  attr_reader :capacity

  def initialize
    @inventory = []
    @capacity = 20
  end

  def take_off(plane)
    self.inventory.delete(plane)
    plane.status = "airborne"
  end

  def confirm_take_off(plane)
    return "The plane has taken off" if plane.status == "airborne" && self.inventory.include?(plane) == false
    "The plane has not taken off"
  end
end