require_relative 'plane'

class Airport
  attr_reader :plane

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
  end

  def takeoff(plane)
    fail "That plane isn't in the airport" unless @planes.include? plane
    @planes.delete(plane)
  end
end
