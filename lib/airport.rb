require './lib/plane.rb'

class Airport
  attr_reader :airport

  def initialize
    @airport = []
  end

  def land(plane)
    fail "Airport full" if @airport.count == 1
     @airport << 1
  end


  def take_off(plane)
    fail "Plane has already taken off" if @airport.count == 0
    @airport.pop
  end

end
