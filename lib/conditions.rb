require_relative 'airport'

class Conditions

  def initialize(plane)
    @plane = plane
  end

  def take_off(airport)
    @plane.flying = true
    @plane.airport = nil
    take_off_confirmation(airport)
  end

  def land(airport)
    @plane.flying = false
    @plane.airport = airport
  end

  private
  def take_off_confirmation(airport)
    confirm = "#{@plane} has left #{airport}."
    confirm unless airport.at_airport?(@plane)
  end
end
