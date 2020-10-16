require_relative 'airport'

class Plane
  def initialize
    @flying = true
    @airport
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
    confirm if airport.landed_planes.include?(self) == false
  end

  def land_errors(airport)
    fail "Airport is full." if airport.full?
    fail "Weather is stormy. Cannot land." if airport.stormy?
    fail "Plane has already landed at #{@airport}." if @flying == false
  end

  def take_off_errors(airport)
    fail "Weather is stormy. Cannot take off." if airport.stormy?
    fail "This plane is not at the specified airport." if airport.landed_planes.include?(self) == false
    fail "This plane is already flying." if @flying == true
  end

  def flying_conditions
    @flying = true
    @airport = nil
  end

  def landing_conditions(airport)
    @flying = false
    @airport = airport
  end

end
