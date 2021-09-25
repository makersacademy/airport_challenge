require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :airport

  def initialize
    @airport = []
  end

  def full?
    @airport.length
  end

  def takeoff(plane)
    plane

    # take off should only happen if the weather is "clear skies"
  end

  def land(plane)
    @airport << plane
    "#{@plane} has landed"
  end
end
