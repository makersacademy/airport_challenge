require_relative 'plane'

class Airport

  attr_reader :plane

  def initialize
    @plane = []
  end

  def land(plane)
    @plane << plane
  end

end
