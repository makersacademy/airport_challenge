require_relative 'airport.rb'

class Plane

def take_off(airport)
  (airport.planes).delete(self)
end

def land(airport)
  airport.planes << self
end

end
