require_relative 'airport'

class Plane
  def land(airport)
    airport.approve_landing(self)
    @airport = airport
  end

  def take_off
    @airport.approve_take_off(self)
    confirm_take_off
    @airport = ""
  end

  private

  def confirm_take_off
    puts "[plane has taken off from airport]" unless @airport.in_hangar?(self)
  end
end
