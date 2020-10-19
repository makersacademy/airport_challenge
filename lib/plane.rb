require_relative 'airport'

class Plane
  def initialize
    @flying = true
    @airport = nil
  end

  def land(airport)
    land_errors(airport)
    landing_conditions(airport)
    airport.landed_planes << self
  end

  def take_off(airport)
    take_off_errors(airport)
    airport.landed_planes.delete(self)
    flying_conditions
    take_off_confirmation(airport)
  end

  def take_off_confirmation(airport)
    confirm = "#{self} has left #{airport}."
    confirm unless at_airport?(airport)
  end

  def land_errors(airport)
    fail "Plane has already landed at #{@airport}." unless @flying
    fail "Airport is full." if airport.full?
    fail "Weather is stormy. Cannot land." if airport.stormy?
  end

  def take_off_errors(airport)
    fail "This plane is already flying." if @flying
    fail "This plane is not at the specified airport." unless at_airport?(airport)
    fail "Weather is stormy. Cannot take off." if airport.stormy?
  end

  def flying_conditions
    @flying = true
    @airport = nil
  end

  def landing_conditions(airport)
    @flying = false
    @airport = airport
  end

  def at_airport?(airport)
    airport.landed_planes.include?(self)
  end

end
