require_relative 'airport'
class Plane
  def initialize
    @on_ground
  end  
  
  def land(airport)
    fail 'already on ground' if @on_ground
    fail 'weather is stormy' if airport.stormy?
    fail 'airport full' if airport.full?
    
    
    
    airport.hanger.push(self)
    @on_ground = airport
  end

  def take_off
    fail 'plane in air' unless @on_ground
    fail 'weather is stormy' if @on_ground.stormy?

    @on_ground = nil
    self
  end

  def in_air?
    !@on_ground
  end    
end
  