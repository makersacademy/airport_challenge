require_relative 'airport'
class Plane
  def initialize
    @on_ground = true
  end

  def land(airport)
    fail 'already on ground' if @on_ground
    fail 'airport full' if airport.full?
    
    
    airport.hanger.push(self)
    @on_ground = true
  end

  def take_off
    fail 'plane in air' unless @on_ground

    @on_ground = false
    self
  end

  def in_air?
    !@on_ground
  end    
end
  