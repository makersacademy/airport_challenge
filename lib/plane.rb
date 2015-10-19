require_relative 'airport'

class Plane

attr_reader :airport

def initialize
  @flying = true
end

def at_airport(airport)
  @airport = airport
end

def take_off
  @airport = nil
  @flying = true
end

def land
  @flying = false
end

def flying?
  @flying
end

end
