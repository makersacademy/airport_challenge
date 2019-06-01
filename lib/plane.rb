require_relative './weather.rb'

class Plane

  def initialize
    @at_airport = true
  end
  
  def land(airport)
    if airport.safe?
      @at_airport = true
    else
      @at_airport = false
    end
  end

  def take_off(airport)
    if airport.safe?
      @at_airport = false
    else
      @at_airport = true
    end
  end

  def at_airport?
    @at_airport  
  end


end