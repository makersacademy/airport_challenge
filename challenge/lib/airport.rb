
#attr_reader :airport, :plane


require_relative './plane.rb'
class Airport

def initialize
@plane = []
end

def land(plane)
  @plane << plane
return "plane has landed"
  end

end
