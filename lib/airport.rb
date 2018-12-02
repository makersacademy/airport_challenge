require_relative 'airplane'

class Airport

  attr_reader :planes

  def initialize
    @airport = []
  end

  def land(plane)
    @airport << plane
  end

  def takeoff
    @airport.pop
  end

end
