require './lib/plane.rb'

class Airport
  attr_accessor :airport

  def initialize
    @airport = []
  end

  def land(plane)
    @airport << plane
  end

  def takeoff(plane)
    @airport.pop
    @airport
  end

end
