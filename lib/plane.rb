require_relative 'airport'

class Plane

attr_reader :airport

def at_airport(airport)
  @airport = airport
end

def flying?
  @airport = nil
end

end
