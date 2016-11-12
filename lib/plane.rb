require_relative "airport.rb"

class Plane

attr_reader :landed

def initialize
  @landed = false
end

def land(airport)
  airport.planes << self
  @landed = true
end



end
