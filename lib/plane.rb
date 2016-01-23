require_relative 'airport'

class Plane

  def land(airport)
    @airport = airport
  end

  def takeoff(airport)
    @airport = false
  end

  def landed?
    true if @airport
  end

  def at_what_airport
    @airport unless !@airport
  end


private

  attr_reader :airport

end
