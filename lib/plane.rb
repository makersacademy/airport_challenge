require_relative 'airport'

class Plane
  attr_accessor :status

  def initialize
    @status = "landed"
  end

  def land(airport)
    return raise "The airport is at capacity! You cannot land!" if airport.inventory.size >= 20
    airport.inventory.push(self)
  end

end