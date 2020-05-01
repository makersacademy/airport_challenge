require_relative 'airport'

class Plane
  attr_accessor :status
  
  def initialize
    @status = "landed"
  end

  def land(airport)
    airport.inventory.push(self)
  end
end