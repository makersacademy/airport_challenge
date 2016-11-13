require_relative "airport.rb"

class Plane

attr_accessor :landed

def initialize
  @landed = true
end

def land(airport)
  fail "Too stormy to land" if !sunny?
  fail "Already landed at another airport" if landed
  airport.planes << self
  @landed = true
end



end
