require_relative 'airport'
class Plane
  attr_reader :at_airport
  def initialize
    @at_airport = true
  end

  def land(airport)
    airport 
  end

  def take_off
    @at_airport = false
    return nil
  end

  def in_air?
    !@at_airport
  end    
end
  