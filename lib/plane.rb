require_relative 'airport'

class Plane

  attr_reader :airport

  def land(airport)
    @airport = airport
    true
  end
end
