require './lib/plane.rb'

class Airport
  attr_reader :planes_at_airport

  def initialize
    @planes_at_airport = []
  end


  def land(plane)
    @planes_at_airport << plane
  end

end
