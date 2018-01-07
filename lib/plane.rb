require_relative 'airport'

class Plane
  attr_reader :airport

  def initialize
    @airport = nil
  end

  def land(target_airport)
    raise 'Plane is already grounded' if landed?
    target_airport.receive(self)
    @airport = target_airport
  end

  def take_off
    raise 'Plane is already airborne' unless landed?
    @airport.dispatch(self)
    @airport = nil
  end

  private
  def landed?
    !@airport.nil?
  end
end
