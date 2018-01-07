require_relative 'airport'

class Plane
  attr_reader :airport

  def initialize
    @airport = nil
  end

  def land(target_airport)
    raise 'Plane is already landed' if landed?
    target_airport.receive(self)
    set_location(target_airport)
  end

  def take_off
    raise 'Plane is already airborne' unless landed?
    @airport.dispatch(self)
    set_location(nil)
  end

  def set_location(airport)
    @airport = airport
  end

  private
  def landed?
    !@airport.nil?
  end
end
