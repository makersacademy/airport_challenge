require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 20

  def initialize
    @airport_spaces = []
  end

  def land(plane)
    fail "Airport full" if @airport_spaces.count >= DEFAULT_CAPACITY  
    @airport_spaces << plane
  end

  def take_off
   return "Plane has taken off"
  end
end