require_relative 'plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    fail "This plane is already landed" if plane.status == :landed
    @planes << plane
  end

end
