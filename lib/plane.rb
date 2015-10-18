require_relative 'airport'

class Plane

attr_reader :airport

def at_airport(airport)
  @airport = airport
end

def report_flying
  @airport = nil
  @flying = true
end

def flying?
  @flying
end

end
