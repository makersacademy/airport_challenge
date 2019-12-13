require './lib/plane.rb'

class Airport
  attr_reader :planes_at_airport
  attr_reader :capacity

  def initialize(capacity = 0)
    @capacity = capacity
    @planes_at_airport = []
  end


  def land(plane)
    @planes_at_airport << plane
  end

end
