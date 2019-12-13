require './lib/plane.rb'

class Airport
  attr_reader :airport

  def initialize
    @airport = []
  end

  def land(plane)
     @airport << 1
  end


  def take_off(plane)
    fail "Plane has already taken off" if @airport.count == 0
    @airport.pop
  end

end
