require_relative "airport.rb"

class Plane

attr_accessor :landed

def initialize
  @landed = true
end

def land(airport)
  airport.planes << self
  @landed = true
end



end
