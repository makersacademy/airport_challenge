require_relative 'plane'

class Airport

def initialize
  @capacity = []
end

def land(plane)
  aircraft_hanger << plane
  "You have landed plane: #{plane}"
end

private

attr_accessor :capacity
attr_reader :plane

def aircraft_hanger
  capacity
end

end
