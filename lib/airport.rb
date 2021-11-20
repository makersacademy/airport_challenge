require_relative 'plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    fail "Airport is full" if @planes.count >= 25
    @planes << plane
  end

  def take_off
    @planes.pop
  end

end
