require_relative 'airport'
require_relative 'errors'

class Plane
  attr_accessor :flying, :airport

  def initialize
    @id = object_id
    @flying = true
  end

  def land(airport)
    Errors.new.land(self, airport)
    Conditions.new.land(self, airport)
    airport.land(self)
  end

  def take_off(airport)
    Errors.new.take_off(self, airport)
    airport.take_off(self)
    Conditions.new.take_off(self, airport)
  end

end

class Conditions
  def take_off(plane, airport)
    plane.flying = true
    plane.airport = nil
    take_off_confirmation(plane, airport)
  end

  def land(plane, airport)
    plane.flying = false
    plane.airport = airport
  end

  private
  def take_off_confirmation(plane, airport)
    confirm = "#{plane} has left #{airport}."
    confirm unless airport.at_airport?(plane)
  end
end
