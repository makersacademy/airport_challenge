require_relative 'airport.rb'

class Plane
  attr_accessor :flying
  
  def initialize(flying = false)
    @flying = flying
  end
  
  def land(airport)
    return "Already landed" if @flying == false
    airport.hangar << self unless airport.stormy == true || 
    airport.hangar.count >= airport.capacity
    @flying = false
  end

  def take_off(airport)
    return "Already in flight" if @flying == true
    return "Plane not in hangar" if !airport.hangar.include? self 
    airport.hangar.pop unless airport.stormy == true
    @flying = true
    confirm(airport)
  end
  
  def confirm(airport)
    "Take off successful"
  end

end
