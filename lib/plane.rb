# plane class
require 'airport.rb'
require 'weather.rb'

class Plane
  def initialize
    @airport = nil
  end

  attr_reader :airport

  def register_airport(airport)
    @airport = airport
  end

  def land(airport)
    self.register_airport(airport)
  end

  def at_airport?(airport)
    @airport == airport && airport.has_plane?(self)
  end

  def confirm_landing(airport)
    self.at_airport?(airport)
  end

  def deregister_airport(airport)
    @airport = nil
  end

  def takeoff(airport)
    self.deregister_airport(airport)
  end

  def confirm_takeoff(airport)
    if self.at_airport?(airport)
      return false
    else
      return true
    end
  end
end
